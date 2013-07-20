#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

@i = 0

# print "%F{1}/"

ENV["PWD"].gsub(/home\/[a-zA-Z0-9]*/, "~").split("/").each { |d|
  print "%F{#{@i}} \u00BB " unless @i < 2
  print "%F{240}#{d}"
  @i += 1
}
