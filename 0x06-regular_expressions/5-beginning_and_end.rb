#!/usr/bin/env ruby
#match any pattern that start with h and end with n with a
#character inbetween
put ARGV[0].scan(/^h.n$/).join
