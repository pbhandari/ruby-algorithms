#!/usr/bin/env ruby

require '../../src/sort/quicksort.rb'
require 'test/unit'

#
class QuickSortTest < Test::Unit::TestCase
  def test_array
    arr = [1, 2, 4, 5, 6, 3]
    sorted = arr.sort
    arr.qsort!
    assert_equal arr, sorted
  end
end
