#!/usr/bin/env ruby
#Write a regex that matches t in a text case
puts ARGV[0].scan(/hb[t]{2,5}n/).join
