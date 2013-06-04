require 'test_helper'

class MashTest < TestCase
  def setup
    mash = Hashie::Mash.new
  end

  def test_nil_or_false_when_not_set
    assert_equal mash.name?, false
    assert_nil mash.name
  end

  def test_getset_onelevel
    mash.name = "mash"

    assert_equal mash.name, "mash"
    assert_equal mash.name?, true
  end

  def test_getset_multilevel
    mash.dog!.name = "bobik"
    assert_equal mash.dog, "bobik"
  end

  def test_false_multilevel_when_not_set
    assert_equal mash.author_.name?, false
  end
end
