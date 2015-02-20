#!/usr/bin/env ruby

# Copyright (c) 2014, Prajjwal Bhandari <pbhandari@pbhandari.ca>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

require_relative '../src/numeric_palindrome.rb'
require 'test/unit'

# Test for the EratGenerator module.
class PalindromeNumberTest < Test::Unit::TestCase
  def test_zero
    assert 0.palindrome?
  end

  def test_single_digit
    10.times { |n| assert n.palindrome? }
  end

  def test_negative_single_digit
    10.times { |n| assert((-n).palindrome?) }
  end

  def test_double_digit
    10.times { |n| assert((n * 11).palindrome?) }

    (10..100).reject { |n| n % 11 }.each { |n| assert_false n.palindrome? }
  end

  def test_negative_double_digit
    10.times { |n| assert((n * -11).palindrome?) }

    (10..100).reject { |n| n % 11 }.each { |n| assert_false((-n).palindrome?) }
  end

  def test_general_case_false
    assert_false 238_794.palindrome?
    assert_false 902_348.palindrome?
    assert_false 913_419.palindrome?
    assert_false 91_010_912.palindrome?
    assert_false 89_234_109.palindrome?
    assert_false 2_908_340_293.palindrome?
  end

  def test_general_case_true
    assert 123_321.palindrome?
    assert 11_233_211.palindrome?
    assert 999_999_999.palindrome?
    assert 987_654_456_789.palindrome?
  end

  def test_trailing_zeroes
    assert 100.palindrome?
    assert_false 11_120.palindrome?
  end

  def test_embedded_zeroes
    assert 1001.palindrome?
    assert_false 111_011.palindrome?
  end
end
