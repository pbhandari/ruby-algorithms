#!/usr/bin/env ruby

require_relative '../erat_generator.rb'
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
