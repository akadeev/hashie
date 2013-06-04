require 'bundler/setup'
Bundler.require

require 'coveralls'
Coveralls.wear!('rails')

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
