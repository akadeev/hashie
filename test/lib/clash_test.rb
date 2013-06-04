require 'test_helper'

class ClashTest < TestCase
  def test_constructor_hash_from_method_chain
    expected = {
      :where => { :abc => 'def' },
      :order => :created_at
    }

    actual = Hashie::Clash.new
    actual.where(:abc => 'def').order(:created_at)

    assert_equal expected, actual
  end
end
