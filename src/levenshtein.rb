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

# Calculates the Levenshtein distance of two strings
module Levenshtein
  # Calcutates the distance of +str1+ and +str2+, using Levenshtein's
  # formula.
  #
  # Params:
  # +str1+:: The first string.
  # +str2+:: The second string.
  #
  # Returns:
  # The levenshtein distance between the two strings.
  def self.distance(str1, str2)
    # to_s to account for possible 'nil'
    str1, str2 = str1.to_s.downcase, str2.to_s.downcase
    m, n = str1.length, str2.length

    return n if m.zero?
    return m if n.zero?

    dist = (0..n).to_a

    str1.chars.each_with_index do |a, i|
      c = i + 1

      str2.chars.each_with_index do |b, j|
        dist[j], c = c, [dist[j + 1] + 1, c + 1, dist[j] + (a == b ? 0 : 1)].min
      end

      dist[n] = c
    end

    dist.last
  end
end
