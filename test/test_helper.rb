ENV['RACK_ENV'] = 'test'

require File.expand_path(File.join(File.dirname(__FILE__), "..", "init"))

require "rack/test"
require "contest"
require "override"
require "quietbacktrace"
require "random_data"
require "spawn"
require "factories"

class Test::Unit::TestCase
  include Rack::Test::Methods
  include Rtopia

  def setup
    # Comment if you don't want to reset the database
    # before each test.
    Ohm.flush
  end

  def app
    Main.new
  end
end
