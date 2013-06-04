require 'test_helper'

class DashTest < TestCase
  def setup
    @person = Person.new
  end

  def test_set_property
    @person.name = 'Bob'
    assert_equal 'Bob', @person.name
  end

  def test_default_value
    assert_equal 'Rubyist', @person.occupation
  end
  
  def test_raises_error_when_required
    assert_raises(ArgumentError) { @person.name = nil }
  end

end
