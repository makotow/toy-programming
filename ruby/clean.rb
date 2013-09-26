#!/usr/bin/env ruby
# -*- mode: ruby; coding: utf-8 -*-

# entry point
begin
  if ARGV.length < 1
    FileCleaner.remove(".")
  elsif
    remover.remove_files_recursively(ARGV)
  end
rescue
  puts "error"
end

