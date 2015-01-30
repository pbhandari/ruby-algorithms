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
    return [self] if Prime.instance.prime? self

    [2, *(3..(self / 2)).step(2)].select do |x|
      self % x == 0 && Prime.instance.prime?(x)
    end
  end
end
