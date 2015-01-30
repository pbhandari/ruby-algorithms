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

# Basic implementation of a DirWalker
module DirWalk
  # Recursively walks the given +directory+ tree performing the given
  # action, +puts+ by default, on each file.
  #
  # Recursion level can be controlled by +max_depth+.
  #
  # Param:
  # +directory+:: The name of the directory to walk on
  # +hidden+:: Whether to show hidden files and folders or not
  # +depth+:: Maximum recursion depth, -1 = infinity
  # +block+:: a 2-arity block which takes in |directory, file|
  def self.walk(directory, hidden: false, depth: -1, &block)
    unless block.arity == 2
      fail WrongArity.new, "Need arity of 2, got #{block.arity}."
    end

    walk_dirs(directory, hidden, depth, &block)
  end

  private

  # Does the actual work for walk, options are the same, only all are
  # mandatory, and arity of block is not checked.
  def self.walk_dirs(directory, hidden, depth, &block)
    return unless File.directory? directory

    Dir.foreach(Dir.new(directory)) do |file|
      next if file =~ /^\.\.?$/
      next if !hidden && file =~ /^\..*$/

      block.call(directory, file)

      walk_dirs(File.join(directory, file), hidden, depth - 1, &block)
    end unless depth == 0

    nil
  end
end
