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

require_relative '../src/levenshtein.rb'
require 'test/unit'

# Test for the Levenshtein module.
class LevenshteinTest < Test::Unit::TestCase
  def test_generic
    assert_equal 3, Levenshtein::distance("kitten", "sitting")
    assert_equal 3, Levenshtein::distance("saturday", "sunday")
    assert_equal 3, Levenshtein::distance("foo", "bar")
  end

  def test_unequal
    assert_equal 1, Levenshtein::distance("bar", "bars")
    assert_equal 1, Levenshtein::distance("bars", "bar")
  end

  def test_empty
    assert_equal 4, Levenshtein::distance("", "bars")
    assert_equal 4, Levenshtein::distance("bars", "")
    assert_equal 0, Levenshtein::distance("", "")
  end

  def test_nil
    assert_equal 4, Levenshtein::distance(nil, "bars")
    assert_equal 4, Levenshtein::distance("bars", nil)
    assert_equal 0, Levenshtein::distance(nil, nil)
  end
end
