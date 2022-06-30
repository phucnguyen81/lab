#!/usr/bin/ruby
# Get directory relative to script location

current_file = File.expand_path(__FILE__)
current_dir = File.expand_path(__dir__)
parent_dir = File.dirname(current_dir)

puts "current file: #{current_file}"
puts "current directory: #{current_dir}"
puts "parent directory: #{parent_dir}"