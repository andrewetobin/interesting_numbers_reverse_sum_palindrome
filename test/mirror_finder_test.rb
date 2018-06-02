require 'minitest/autorun'
require './lib/mirror_finder'

class MirrorFinderTest < Minitest::Test

  def test_it_filters_aggregates_over_1000
    mf = MirrorFinder.new

    assert mf.big_enough?(1001)
    refute mf.big_enough?(1000)
    refute mf.big_enough?(999)
  end

  def test_it_reverses_numbers
    mf = MirrorFinder.new

    assert_equal 74, mf.reverse(47)
    assert_equal 123, mf.reverse(321)
    assert_equal 121, mf.reverse(121)
    assert_equal 21, mf.reverse(120)
  end

  def test_it_finds_a_mirror
    mf = MirrorFinder.new

    assert mf.find_mirror(1000)
  end

  def test_find_ians_numbers
    mf = MirrorFinder.new
    output = []
    floor = 1
    while output.count < 25
      result = mf.find_mirror(floor)
      floor = result
      output << result
    end

    puts output.inspect
  end

  def test_detects_palindromes
    mf = MirrorFinder.new

    assert mf.palindrome?(121)
    refute mf.palindrome?(12)
  end
end
