#!/usr/bin/env ruby
#Tastme task
puts ARGV[0]
       .scan(/(?<=from:|to:|flags:).*?(?=\])/)
       .join(',')
