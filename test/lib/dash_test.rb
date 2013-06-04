require 'test_helper'

class DashTest < TestCase
  def setup
    @person = Person.new(:name => 'Bob')
  end

  def test_get_property
    assert_equal 'Bob', @person.name
  end

end
