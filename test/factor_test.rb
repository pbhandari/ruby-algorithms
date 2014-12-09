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

require_relative '../src/factor'
require 'test/unit'
require 'prime'

# Test the new factor module
class FactorTest < Test::Unit::TestCase
  def get_num_from_factor(factor)
    factor.reduce(1) { |a, e| a * (e[0]**e[1]) }
  end

  def test_zero_factor
    assert_raise Math::DomainError do
      0.factor
    end
  end

  def test_positive_factor
    1_000.times do
      num = Random.rand(1..100_000)
      actual = get_num_from_factor num.factor
      assert_equal num, actual,
                   "Expected #{num}, actual #{actual}, factor #{num.factor}"
    end
  end

  def test_negative_factor
    1_000.times do
      num = Random.rand(-100_000..-1)
      actual = get_num_from_factor num.factor
      assert_equal num, actual,
                   "Expected #{num}, actual #{actual}, factor #{num.factor}"
    end
  end

  def test_factors_are_primes
    1_000.times do
      num = Random.rand(1..100_000)
      factors = num.factor
      assert factors.all? { |f| Prime.instance.prime? f.first },
             "Non-prime factor for #{num}:- #{factors}"
    end
  end
end
