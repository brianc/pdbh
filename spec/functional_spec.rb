
require 'rack/test'
module Rack::Test::Methods
  def app
    Rack::Builder.new do
      Dir.chdir(::File.dirname(__FILE__)+"/..") do
        instance_eval(::File.read("config.ru"))
      end
    end
  end
end

describe "private.deadblackhearts.com" do
  include Rack::Test::Methods
  it "should have root url" do
    get "/"
    last_response.should be_ok
  end
end
