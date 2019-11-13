#!/usr/bin/env ruby

require 'getoptlong'
require_relative 'fetchUrl'
require 'logger'

log = Logger.new STDOUT

opts = GetoptLong.new(
[ '--help', '-h', GetoptLong::NO_ARGUMENT ],
[ '--verbose', '-v', GetoptLong::NO_ARGUMENT ],
[ '--silent', '-s', GetoptLong::REQUIRED_ARGUMENT ])

HELPMESSAGE = """
Command: mathin.rb [options] URL
Params:
    URL         -       the URL of the page to be fetched
Options:
    --help      -h      Print help (this text) and exit.
    --verbose   -v      Be more verbose about what you're doing.
    --silent    -s      Don't log anything at all.
"""

verbose = false

opts.each do |opt, arg|
    case opt
        when '--help' then print HELPMESSAGE; exit 0
        when '--verbose' then log.level = :debug
        when '--silent' then log.level = :Unknown
        # when '--tree' then $tree = arg
        else print "Unknown option (#{opt}). Ignored"
    end
end

puts fetchUrl('https://pl.wikipedia.org/wiki/Wikipedia:Strona_g%C5%82%C3%B3wna', log)
    .tryEncode(log)
    .unHTMLize(log)
    .removeEmptyLines(log)
    .split(/(?<=[\.\?\!])/)
    .select {|line| !line.match /^\s*$/ }
    .map {|line| line.chomp}
puts 'end'
