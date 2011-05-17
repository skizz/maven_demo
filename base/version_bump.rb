#!/usr/bin/env ruby -w

require 'rubygems'
require File.dirname(__FILE__) + '/lib/version_bumper'

ERR_NO_COMPONENT_SPECIFIED = -1
ERR_VERSION_REGRESSION = -2
ERR_VERSION_NOT_FOUND = -3

POM_FILE='pom.xml'

def write_pom_contents(dest_pom, pom_contents)
	if pom_contents.nil?
		$stderr.puts "Error: Unable to replace version in POM file."
		exit ERR_VERSION_NOT_FOUND
	end

	File.open(dest_pom, 'w') do |file|
		unless pom_contents.nil?
			file.write(pom_contents)
			puts "Changed #{dest_pom} version"
		else
			$stderr.puts "WARNING: Unable to modify version for #{dest_pom}"
		end
	end
end

if ARGV[0].nil? or ARGV[1].nil?
	puts "You must specify the parent pom filepath you wish to increment."
	puts ""
	puts " Example"
	puts " #{$0} Component1 123"
	puts ""

	exit ERR_NO_COMPONENT_SPECIFIED
end

parent_pom_path = ARGV[0]
maintenance_version = ARGV[1]
version_bumper = VersionBumper.new
next_version = nil
pom_contents = nil

parent_pom = File.join(parent_pom_path, POM_FILE)
File.open(parent_pom, 'r') do |file|
	version_bumper.pom_contents = file.read
	pom_contents = version_bumper.replace_pom_version(maintenance_version, true)
	next_version = version_bumper.next_version
end

if next_version.nil?
  $stderr.puts "Error: Regression in version."
	exit ERR_VERSION_REGRESSION
end

puts "Changing parent pom.xml to #{next_version}"
write_pom_contents(parent_pom, pom_contents)

child_poms = Dir.glob(File.join(parent_pom_path, '**', POM_FILE)).reject{|pom| pom == parent_pom}
child_poms.each do |child_pom|
	File.open(child_pom, 'r') do |file|
		version_bumper.pom_contents = file.read
		pom_contents = version_bumper.replace_pom_version(next_version, false)
	end
	write_pom_contents(child_pom, pom_contents)
end

