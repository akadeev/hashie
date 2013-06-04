require 'bundler/setup'
Bundler.require

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!('rails')
end

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
