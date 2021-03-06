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

require_relative '../src/erat_generator.rb'
require 'test/unit'
require 'prime'

# Test for the EratGenerator module.
class EratGenTest < Test::Unit::TestCase
  def setup
    @my_gen = EratGen.new
    @prime_gen = Prime::EratosthenesGenerator.new
  end

  def test_validity
    1_000_000.times do
      assert_equal(@prime_gen.succ, @my_gen.succ)
    end
  end

  def test_at
    primes = Array.new(1_000) { @prime_gen.succ }
    100.times do
      rand_idx = Random.rand(1_000)
      assert_equal primes[rand_idx], @my_gen[rand_idx]
    end
  end
end
