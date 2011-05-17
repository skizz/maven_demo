require 'rubygems'
require File.dirname(__FILE__) + '/../lib/version_bumper'
require 'test/unit'

class VersionBumperTest < Test::Unit::TestCase
	def setup
		@instance = VersionBumper.new
	end

	def teardown
		@instance = nil
	end

	def test_replace_tag_is_correct_if_parent
		expected = 'project/version'
		result = @instance.search_path(true)
		assert_equal(expected, result)
	end

	def test_replace_tag_is_correct_if_child
		expected = 'project/parent/version'
		result = @instance.search_path
		assert_equal(expected, result)
	end

	def test_maintenance_version_with_developer_version
		expected = '2.1.4'
		result = @instance.maintenance_version('2.1.3-4','4')
		assert_equal(expected, result)
	end

	def test_maintenance_version_with_snapshot_version
		expected = '2.1.4'
		result = @instance.maintenance_version('2.1.3-SNAPSHOT','4')
		assert_equal(expected, result)
	end

	def test_maintenance_version_with_maintenance_version
		expected = '2.1.4'
		result = @instance.maintenance_version('2.1.3','4')
		assert_equal(expected, result)
	end

	def test_maintenance_version_with_regressed_version_number
		result = @instance.maintenance_version('2.1.3','2')
	  assert_nil(result)
	end

	def test_maintenance_version_with_same_version_number
		result = @instance.maintenance_version('2.1.3','3')
	  assert_nil(result)
	end

	def test_extract_pom_version_from_parent
		expected = '<version>2.1.3</version>'
		@instance.pom_contents = '<project><version>2.1.3</version></project>'
		result = @instance.pom_version(true).to_html
		assert_equal(expected, result)
	end

	def test_extract_pom_version_from_child
		expected = '<version>2.1.3</version>'
		@instance.pom_contents = '<project><parent><version>2.1.3</version></parent></project>'
		result = @instance.pom_version.to_html
		assert_equal(expected, result)
	end

	def test_replace_pom_version_when_child
		expected = '<project><parent><version>2.1.4</version></parent></project>'
		@instance.pom_contents = '<project><parent><version>2.1.3</version></parent></project>'
		result = @instance.replace_pom_version('2.1.4', false)
		assert_equal(expected, result)
	end

	def test_replace_pom_version_when_parent
		expected = '<project><version>2.1.4</version></project>'
		@instance.pom_contents = '<project><version>2.1.3</version></project>'
		result = @instance.replace_pom_version('4', true)
		assert_equal(expected, result)
	end

	def test_next_version_is_updated_after_replace_pom_version_when_parent_is_called
		expected = '2.1.4'
		@instance.pom_contents = '<project><version>2.1.3</version></project>'
		@instance.replace_pom_version('4', true)
		result = @instance.next_version
		assert_equal(expected, result)
	end

	def test_replace_pom_version_fails_if_version_regresses
		@instance.pom_contents = '<project><version>2.1.4</version></project>'
		result = @instance.replace_pom_version('3', true)
		assert_nil(result)
	end
end
