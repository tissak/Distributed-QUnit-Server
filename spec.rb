#!/usr/bin/env ruby
require 'net/http'
require 'uri'

url = URI.parse('http://localhost:4567/')
Net::HTTP.start(url.host, url.port) do |http|
  http.get('/trigger')
end
