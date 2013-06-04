require 'bundler/setup'
Bundler.require

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end

MiniTest::Unit.autorun

Dir[File.expand_path('../fixtures/**/*.rb', __FILE__)].each { |f| require f }

class TestCase < MiniTest::Unit::TestCase

end
