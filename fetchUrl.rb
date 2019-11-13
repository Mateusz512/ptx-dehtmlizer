#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'cgi'
require_relative 'replacements'

def fetchUrl(url, log)
    begin
        log.debug "Trying to fetch #{url}"

        uri = URI.parse(url)
        response = Net::HTTP.get_response uri

        log.debug 'Fetched successfully!'
        return CGI.unescape response.body
    rescue SocketError => error
        log.fatal 'Could not connect to URL!'
        exit 1
    end
end

class String

    def tryEncode(log)
        rawBody = self
        log.debug 'Trying to determine encoding'

        encoding = 'UTF-8'

        match = rawBody.match /charset="?(?<determined>[^"]*)"/i
        if (match)
            encoding = match[:determined]
            log.debug "Determined encoding: #{encoding}"
            rawBody = rawBody.force_encoding(encoding)
        else
            log.debug "Could not determine encoding, using #{encoding} by default"
        end

        return rawBody.encode 'UTF-8'
    end

    def unHTMLize(log)
        rawBody = self
        if rawBody.match /<body.*<\/body>/im
            log.debug "The HTML has a valid <body> tag. Trimming to <body> only."
            match = rawBody.match /<body[^<]*>(?<body>.*)<\/body>/im
            rawBody = match[:body]
        else
            log.debug "The HTML has no valid <body> tag. Using the whole markup."
        end

        rawBody.gsub!(/<head.*\/head[^>]*>/, '')
        rawBody.gsub!(/<(script|style)\b[^>]*>(.*?)<\/(script|style)>/m, '')
        rawBody.gsub!(/<\/li>/, '.</li>')
        rawBody.gsub!(/<[^>]*>/m, '')

        replacements.each { |key, value| 
            if (!key[0].strip.empty?) then rawBody.gsub!(key[0], value) end
            if (!key[1].strip.empty?) then rawBody.gsub!(key[1], value) end
        }
        
        return rawBody
    end

    def postprocess(log)
        rawBody = self
        rawBody.gsub!(/[[:space:]]+/, ' ')
        rawBody.gsub!(/[[:blank:]][\?\.\!]/) { |punct| "#{punct.strip}" }
        rawBody.gsub!(/[\?\.\!][[:blank:]][[:upper:]]?/) { |punct| 
            punct.gsub(/[\?\.\!]/) { |dot| "#{dot}\n" }
        }
        return rawBody.split("\n")
            .map { |line| line.chomp }
            .select { |line| line.match /[[:alpha:]]/ }
    end

end
