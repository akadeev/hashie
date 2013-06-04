require 'test_helper'

class TrashTest < TestCase
  def test_getset_property
    @cat = Cat.new(:firstName => 'Ignat', :lastName => 'Ogurtsov')

    assert_equal 'Ignat', @cat.first_name
    assert_equal 'Ogurtsov', @cat.last_name
  end
end
