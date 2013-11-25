require 'test_helper'
require 'ember/appkit/rails/resource_override'

class ResourceOverrideTest < Rails::Generators::TestCase
  include GeneratorTestSupport

  tests Rails::Generators::ResourceGenerator
  destination File.join(Rails.root, "tmp")
  setup :prepare_destination, :copy_routes

  test "create template without ember" do
    run_generator ["post"]
    assert_no_file "app/assets/javascripts/templates/post.hbs"
  end

  test "create template with ember" do
    run_generator ["post", '--ember']
    assert_file "app/assets/javascripts/templates/post.hbs"
  end
end