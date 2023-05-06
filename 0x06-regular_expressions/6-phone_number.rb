#!/usr/bin/env ruby
#match a ten digit phone number
puts ARGV[0].scan(/\d*{10}/).join
