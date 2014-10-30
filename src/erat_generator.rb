#!/usr/bin/env ruby

# Prime Generator that uses a modified Sieve of Eratosthenes to generate
# primes.
class EratGen
  # Creates a new Prime Generator that generates primes using the
  # Sieve of Eratosthenes
  def initialize
    @primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59,
               61, 67, 71, 73, 79, 83, 89, 97, 101]
    # @max_checked must be an even number
    @max_checked = @primes.last + 1
    @last_prime_index = -1
  end

  # Generate the next prime number
  def succ
    @last_prime_index += 1
    compute_primes unless @last_prime_index < @primes.size
    @primes[@last_prime_index]
  end
  alias_method :next, :succ

  # Gets the +n+th prime. +n+ has to be positive, or a small negative number,
  # +n+ < -10 can act weird.
  #
  #
  # Param:
  # +n+:: Which prime to get.
  def [](n)
    # TODO: handle negative +n+ properly
    succ until n < @primes.size
    @primes[n]
  end

  # Compute the next set of primes and store it.
  # ---
  # This is done by using Eratosthenes' Sieve on the numbers from
  # @max_checked to @max_checked*2.
  # +++
  def compute_primes
    nums = (@max_checked..@max_checked * 2).map { |x| x.odd? ? x : nil }.to_a
    1.upto(@primes.index { |p| p * p > @max_checked * 2 }) do |i|
      start_idx = -@max_checked % @primes[i] # prime[i]'s 1st multiple's index

      (start_idx..nums.size).step(@primes[i]) { |x| nums[x] = nil }
    end
    @max_checked *= 2
    @primes += nums.compact
  end
end
