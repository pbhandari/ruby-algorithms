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
    str1 = str1.to_s.downcase
    str2 = str2.to_s.downcase

    return str2.length if str1.empty?
    return str1.length if str2.empty?

    dist = (0..str2.length).to_a

    str1.length.times { |i| update_costs(dist, str1[i], str2, i + 1) }

    dist.last
  end

  private

  def self.new_cost(add_cost, del_cost, curr_cost, subs_needed)
    [add_cost + 1, del_cost + 1, curr_cost + (subs_needed ? 0 : 1)].min
  end

  def self.update_costs(costs, char1, str2, min)
    str2.length.times do |j|
      tmp = min
      min = new_cost(costs[j + 1], min, costs[j], char1 == str2[j])
      costs[j] = tmp
    end
    costs[-1] = min

    costs
  end
end
