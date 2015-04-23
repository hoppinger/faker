require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBsn < Test::Unit::TestCase

  def test_bsn_length
    assert [8,9].include?(Faker::Bsn.bsn.size)
  end

  def test_bsn_validity
    bsn = Faker::Bsn.bsn
    elfproef = bsn.to_i
    assert elfproef % 11 == 0
  end
end
