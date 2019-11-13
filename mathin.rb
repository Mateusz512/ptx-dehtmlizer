#!/usr/bin/env ruby

require 'getoptlong'
require_relative 'fetchUrl'
require 'logger'

log = Logger.new STDOUT

opts = GetoptLong.new(
[ '--help', '-h', GetoptLong::NO_ARGUMENT ],
[ '--verbose', '-v', GetoptLong::NO_ARGUMENT ],
[ '--silent', '-s', GetoptLong::NO_ARGUMENT ],
[ '--file', '-f', GetoptLong::REQUIRED_ARGUMENT ])

HELPMESSAGE = """
Command: mathin.rb [options] URL
Params:
    URL         -       the URL of the page to be fetched
Options:
    --help          -h          Print help (this text) and exit.
    --verbose       -v          Be more verbose about what you're doing.
    --silent        -s          Don't log anything at all.
    --file FILE     -f FILE     File to be used as output.
"""

INTRO = """
Mateusz Hinc - 452086

Program ekstrahujący 'ładny' tekst w języku polskim ze strony internetowej.

-h wyświetla listę opcji (po angielsku).

"""

fileName = ''

opts.each do |opt, arg|
    case opt
        when '--help' then print HELPMESSAGE; exit 0
        when '--verbose' then 
            log.level = :debug
            print INTRO
        when '--silent' then log.level = :Unknown
        when '--file' then fileName = arg.to_s
        else print "Unknown option (#{opt}). Ignored"
    end
end

if ARGV.length != 1
    print "Not enough arguments! Please specify URL."
    exit 1
end

url = ARGV[0]

fetchedText = fetchUrl(url, log)
    .tryEncode(log)
    .unHTMLize(log)
    .postprocess(log)

if fileName.empty? 
    log.debug "Writing to STDOUT"
    fetchedText.each { |line| 
        puts line
    }
else
    log.debug "Writing to file: #{fileName}"
    File.open(fileName, 'w') { |file| 
        fetchedText.each { |line| 
            file.write "#{line}\n"
        }
    }
end
