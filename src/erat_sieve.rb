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

# An implementation of the Sieve of Eratosthenes. This containes a function to
# generate primes upto, and including, a given limit.
class EratSieve
  # Recursively sieve out the primes in the given array
  # Get a list of all the primes up-to and including the +limit+.
  #
  # Params:
  # +limit+:: The largest number we check for
  def self.generate(limit)
    def self.sieve(arr, p)
      return arr if p * p >= arr.size  # don't sieve if max num is < p^2

      (p * p..arr.size).step(p) { |m| arr[m] = nil }  # mark multiples as nil

      sieve(arr, p = arr.index { |x| x && x > p })  # recurse on next prime
    end

    return [] unless limit > 1  # no primes < 1

    # sieve out rest of the primes
    sieve([nil, nil, 2, *(3..limit).map { |x| x.odd? ? x : nil }], 3).compact
  end
end
