#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'cgi'

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

        match = rawBody.match /charset="?(?<determined>.*)"/i
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
            log.info "The HTML has a valid <body> tag. Trimming to <body> only."
            match = rawBody.match /<body[^<]*>(?<body>.*)<\/body>/im
            rawBody = match[:body]
        else
            log.debug "The HTML has no valid <body> tag. Using the whole markup."
        end

        return rawBody.gsub(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/im, '')
                      .gsub(/<style\b[^<]*(?:(?!<\/style>)<[^<]*)*<\/style>/im, '')
                      .gsub(/<(.|\n)*?>/im, '')
    end

    def removeEmptyLines(log)
        rawBody = self
        return rawBody
        # return rawBody.gsub /^[^\w]*$/, ''
    end

end
