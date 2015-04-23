require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerBsn < Test::Unit::TestCase

  def test_bsn_should_have_length_of_eight_or_nine
    assert [8,9].include?(Faker::Bsn.bsn.size)
  end
end
