require 'test_helper'

class MashTest < TestCase
  def setup
    @mash = Hashie::Mash.new
  end

  def test_nil_when_not_set
    assert_nil @mash.name
  end

  # def test_answer_is_false_when_not_set
  #   assert_equal false, @mash.name?
  # end

  # def test_answer_is_true_when_set
  #   @mash.name = "mash"
  #   assert_equal true, @mash.name?
  # end

  def test_getset_onelevel
    @mash.name = "mash"
    assert_equal "mash", @mash.name
  end

  # def test_can_define_multilevel
  #   @mash.dog!.name = "bobik"
  #   assert_equal "bobik", @mash.dog
  # end

  # def test_answer_is_true_multilevel_when_not_set
  #   assert_equal false, @mash.author_.name?
  # end
end
