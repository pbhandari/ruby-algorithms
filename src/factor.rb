#!/usr/bin/env ruby

require 'prime'

# Monky-Patch the Integer class.
class Integer
  # Get the factors of the given integer.
  #
  # Return:
  # The prime factorization of the number in the following format:
  # [[prime1, exp1], [prime2, exp2] ... [primeN, expN]] such that
  # number = prime1**exp1 * prime2**exp2 * ... * primeN**expN
  #
  # Example:
  #  10.factor = [[2, 1], [5, 1]]
  def factor
    # You cannot get prime factors of zero
    fail Math::DomainError, 'Cannot factor numbers <= 0.' if zero?

    # Edge cases
    return [[2, 0]] if self == 1
    return [[-1, 1]] + abs.factor if self < 0

    num = self

    # compute the factors, by checking against all primes < +sqrt(self)+.
    prime_factors.each_with_object(1).map do |x, c|

      # count the number of times +x+ goes into +num+
      c += 1 while (num /= x) % x == 0

      [x, c]
    end
  end

  def prime_factors
    return [self] if Prime.instance.prime self

    (2..Math.sqrt(self)).step(2).select do |x|
      self % x == 0 && Prime.instance.prime?(x)
    end
  end
end
