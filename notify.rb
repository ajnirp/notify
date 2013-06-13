#!/usr/bin/env ruby

require File.expand_path "../trollop.rb", __FILE__

SUB_COMMANDS = %w(add view delete)
global_opts = Trollop::options do
  version "notify version 1.0"
  banner "notify is an easy-to-use CLI app for managing notifications"
  stop_on SUB_COMMANDS
end

cmd = ARGV.shift
cmd_opts = case cmd
  when "add"
    Trollop::options do
      opt :hours,   "Hours from now",   type: Integer, short: "-H"
      opt :minutes, "Minutes from now", type: Integer, short: "-M"
      opt :days,    "Days from now",    type: Integer, short: "-D"
      opt :weeks,   "Weeks from now",   type: Integer, short: "-W"
    end
  when "view"
    Trollop::options do
      opt :id,   "Id of the alarm to view", type: Integer, short: "-i"
      opt :last, "View the last alarm",                    short: "-l"
      opt :all,  "View all alarms",                        short: "-a"
    end
  when "delete"
    Trollop::options do
      opt :id,   "Id of the alarm to delete", type: Integer, short: "-i"
      opt :last, "Delete the last alarm",                    short: "-l"
      opt :all,  "Delete all alarms",                        short: "-a"
    end
  when nil
    puts "notify is an easy-to-use CLI app for managing notifications"
    puts "Try -h or --help for more help"
    puts "To get help on a subcommand try `notify <subcommand> --help'"
  else
    Trollop::die "Sorry, #{cmd.inspect} is not a recognized subcommand"
end

puts cmd_opts
# send cmd