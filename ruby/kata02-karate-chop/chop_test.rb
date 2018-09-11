require 'minitest/autorun'
require_relative 'chop'

class ChopTest < Minitest::Test

  # empty

  def test_empty_array
    # skip
    assert_equal(-1, chop(3, []))
  end

  # one item

  def test_single_item_array_value_not_found
    # skip
    assert_equal(-1, chop(3, [1]))
  end

  def test_single_item_array_value_exists
    # skip
    assert_equal(0,  chop(1, [1]))
  end

  # three items

  def test_three_item_array_first_item
    # skip
    assert_equal(0,  chop(1, [1, 3, 5]))
  end

  def test_three_item_array_second_item
    # skip
    assert_equal(1,  chop(3, [1, 3, 5]))
  end

  def test_three_item_array_third_item
    # skip
    assert_equal(2,  chop(5, [1, 3, 5]))
  end

  def test_three_item_array_value_missing_before_first
    # skip
    assert_equal(-1, chop(0, [1, 3, 5]))
  end

  def test_three_item_array_value_missing_after_first
    # skip
    assert_equal(-1, chop(2, [1, 3, 5]))
  end

  def test_three_item_array_value_missing_after_second
    # skip
    assert_equal(-1, chop(4, [1, 3, 5]))
  end

  def test_three_item_array_value_missing_after_last
    # skip
    assert_equal(-1, chop(6, [1, 3, 5]))
  end

  # four items

  def test_four_item_array_first_item
    # skip
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
  end

  def test_four_item_array_second_item
    # skip
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
  end

  def test_four_item_array_third_item
    # skip
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
  end

  def test_four_item_array_fourth_item
    # skip
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
  end

  def test_four_item_array_value_missing_before_first
    # skip
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
  end

  def test_four_item_array_value_missing_after_first
    # skip
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
  end

  def test_four_item_array_value_missing_after_second
    # skip
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
  end

  def test_four_item_array_value_missing_after_third
    # skip
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
  end

  def test_four_item_array_value_missing_after_last
    # skip
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end

  def test_locate_value_in_large_array
    # skip
    assert_equal(9, chop(89, [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]))
  end

end
