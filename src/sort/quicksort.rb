#!/usr/bin/env ruby

# Implement the quicksort algorithm
module QuickSort
  def qsort
    clone.qsort!

    clone
  end

  def qsort!(top = 0,  pivot = length - 1)
    return unless pivot > top

    partition_idx = qpartition(top, pivot, pivot)

    qsort!(top, partition_idx - 1)
    qsort!(partition_idx + 1, pivot)
  end

  private

  def qpartition(left, right, pivot)
    (left..right).each do |i|
      greater << i

      next if self[i] > self[pivot]

      prev_swap = greater.shift
      self[prev_swap], self[i] = self[i], self[prev_swap]
    end
  end
end

#
class Array
  include QuickSort
end
