#!/usr/bin/ruby
# This script wraps long labels in GraphViz dot files.
# Usage: ruby dotwrap.rb < flow.dot > flow.wrapped.dot
 
# Based on https://github.com/rails/rails/blob/21b55e4462c2a9d3a6420d2754ab63a9d6f01da8/actionpack/lib/action_view/helpers/text_helper.rb#L215.
width=20

def word_wrap(text, line_width=60)
text.split("\n").collect do |line|
line.length > line_width ? line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1\\n").strip : line
end * "\n"
end
 
ARGF.each_line do |line|
s = line.gsub(/label\s?=\s?"(.*)"/) do |label|
"label = \"#{word_wrap($1, width)}\""
end
puts s
end
