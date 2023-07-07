#!/usr/bin/env ruby

require 'pathname'
require 'shellwords'
require 'tty-command'

def beet_import(folder)
  cmd = TTY::Command.new(pty: false, printer: :pretty)
  cmd.run("beet import '#{folder}'", :err => :out, env: {EDITOR: "nvim"})
end

beets_log = File.open("beet_log.txt")

skipped_to_import = "to_import.txt"
duplicates_to_remove = "to_remove.txt"

skipped = []
duplicate = []

beets_log.each_line do |line|

  folder = line.split(";")[0]

  if folder.include?("duplicate")
    duplicate << Pathname.new(File.join(folder.gsub("duplicate-skip ","").chomp)).dirname.to_s + "\n"
    next
  end

  if folder.include?("skip")
    skipped << Pathname.new(File.join(folder.gsub("skip ","").chomp)).dirname.to_s + "\n"
  end

end

skipped = skipped.uniq.map { |x| Pathname.new(x) }
duplicate = duplicate.uniq.map { |x| Pathname.new(x) }

skipped.each do |folder|
  File.open(skipped_to_import, 'a') do |f|
    f << folder.to_s.shellescape
  end
end

duplicate.each do |folder|
  File.open(duplicates_to_remove, 'a') do |f|
    f << folder.to_s
  end
end

#OLDIFS=$IFS; IFS=$'\n'; for folder in $(tac to_import.txt); do beet import $folder; done

#skipped.each do |folder|
#  puts "#{folder.to_s.shellescape}"
#end
