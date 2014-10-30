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

require_relative '../src/erat_sieve.rb'
require 'test/unit'
require 'prime'

# Tests for the eratoshenes sieve
class EratosthenesSieveTest < Test::Unit::TestCase
  def test_largest_prime_is_lower_than_given_limit
    random_num = Random.rand(1_000)
    arr = EratSieve.generate(random_num)
    assert arr.last <= random_num
  end

  def test_all_items_are_primes
    num_primes = 10_000_000
    prime_gen = Prime::EratosthenesGenerator.new
    expected_primes = prime_gen.take_while { |p| p < num_primes }
    actual_primes = EratSieve.generate(num_primes)

    assert_equal expected_primes, actual_primes
  end
end
