#!/usr/bin/env ruby
# -*- mode: ruby; coding: utf-8 -*-

require 'fileutils'

DELETE_LIST_RE = ["\w*~$", "^\\#.*", "^a\\.exe.*", "^a\\.out$", ".*\\.class$"];

class FileRemover
  def initialize(path)
    @config_path = path
    load_confg(path)
  end

  def load_config(path)
    # TODO load configuration from yaml
  end

  #なんかここおかしい。
  def remove_files_recursively(files)
    files.each do |file|
      Dir.glob("#{file}/**/*") do |f|
        deleteFile(f) unless File.directory?(f)
      end
    end
  end

  def remove_file
    Dir.glob("*") do |f|
      deleteFile(f) unless File.directory?(f)
    end
  end

  def delete_file(f)
    #TODO 何とかしたい
    DELETE_LIST_REGEX.each do |word|
      if /#{word}/ =~ File.basename(f)
        FileUtils.rm f
      end
    end
  end
end


# entry point
def main
  # TODO: treat correct exception
  begin
    # TODO: Option parse
    # -config=xxxxx(path)　file ...
    # -
    remover = FileRemover.new

    if ARGV.length < 1
      remover.removeFile
    elsif
      remover.removeFilesRecursively(ARGV)
    end
  rescue
    puts "error"
  end
end

main
