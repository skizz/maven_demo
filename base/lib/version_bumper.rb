require 'hpricot'

class VersionBumper
	attr :next_version

	def initialize(pom_contents = nil)
		pom_contents = pom_contents unless pom_contents.nil?
	end

	def pom_contents=(contents)
		@doc = Hpricot::XML(contents)
	end

	def search_path(is_parent = false)
		is_parent ? 'project/version' : 'project/parent/version'
	end

	def maintenance_version(current_version, maintenance_version)
		split_version = [$1, $2, maintenance_version] if current_version =~ /(\d+)\.(\d+)\.(\d+)[-\d+]?/
		return nil if $3 >= maintenance_version
		split_version.join('.')
	end

	def pom_version(is_parent = false)
		(@doc/search_path(is_parent)).first
	end

	def replace_pom_version(version_change, is_parent)
		version = pom_version(is_parent)

		return nil if version.nil?

		current_version = version.inner_html
		@next_version = is_parent ? maintenance_version(current_version, version_change) : version_change

		return nil if @next_version.nil?

		version.inner_html = @next_version
		@doc.to_html
	end
end
