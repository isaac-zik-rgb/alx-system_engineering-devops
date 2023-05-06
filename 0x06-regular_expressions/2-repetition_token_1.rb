#!/usr/bin/env ruby
#match the pattern given
h.[^b]{2,3}n
puts ARGV[0].scan(/h[tb]{1}n/).join
