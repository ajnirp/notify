#!/usr/bin/env ruby

require File.expand_path "../trollop.rb", __FILE__

SUB_COMMANDS = %w(add view delete)
global_opts = Trollop::options do
  version "notify version 1.0"
  banner "notify is an easy-to-use CLI app for managing notifications"
  opt :version, "Display version number and exit", short: '-v'
  opt :help, "Display help and exit", short: '-h'
  stop_on SUB_COMMANDS
end

cmd = ARGV.shift
cmd_opts = case cmd
  when "add"
    Trollop::options do
      opt :hours, "Hours from now"
      opt :minutes, "Minutes from now"
      opt :days, "Days from now"
      opt :weeks, "Weeks from now"
    end
  when nil
    puts "notify is an easy-to-use CLI app for managing notifications"
    puts "Try --help for help."
  else
    Trollop::die "Sorry, #{cmd.inspect} is not a recognized subcommand"
end