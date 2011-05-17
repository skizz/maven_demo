#!/usr/bin/env ruby -w

require 'rubygems'
require 'hpricot'

ERR_NO_COMPONENT_SPECIFIED = -1

if ARGV[0].nil? or ARGV[1].nil?
	puts "You must specify the component you wish to increment."
	exit ERR_NO_COMPONENT_SPECIFIED
end

pom = File.join(ARGV[0], 'pom.xml')
pom_contents = nil
maintenance_version = ARGV[1]
current_version = nil
next_version = nil

File.open(pom, 'r') do |file|
	doc = Hpricot::XML(file.read)
	(doc/"project/version").each do |v|
		current_version = v.inner_html
		split_version = [$1, $2, maintenance_version] if current_version =~ /(\d+)\.(\d+)\.\d+[-\d+]/
		next_version = v.inner_html = split_version.join('.')
	end

	pom_contents = doc.to_html
end

File.open(pom, 'w') do |file|
  file.write(pom_contents)
end

puts "Changed #{pom} version from #{current_version} to #{next_version}"
