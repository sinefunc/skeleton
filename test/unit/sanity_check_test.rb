require 'test_helper'

class SanityCheckTest < Test::Unit::TestCase
  should "be able to generate a random name" do
    assert_instance_of(String, Random.full_name)
  end

  should "be able to provide pending specs"
end
