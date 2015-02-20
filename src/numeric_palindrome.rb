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

# Check if a number is a palindromic number.
module PalindromeNumber
  def self.palindrome?(num)
    num = num.abs  # only handle positive numbers

    size = 10**Math.log10(num).to_i # get number of digits in number

    # check the first and last digits
    while num >= 10
      return false unless (num / size).to_i == num % 10

      # strip the first and last digits from the number
      num -= (num % 10) * size
      num /= 10

      size /= 100 # we have 2 fewer digits
    end

    true
  end
end

# Monkey-patch the fixnum class
class Fixnum
  def palindrome?
    num = abs

    # strip trailing zeroes
    num /= 10 while num % 10 == 0 && !num.zero?

    PalindromeNumber.palindrome? num
  end
end

p 123_321.palindrome?
