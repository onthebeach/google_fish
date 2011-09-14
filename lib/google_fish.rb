class GoogleFish
  attr_accessor :key, :source, :target, :q, :translated_text, :format

  def initialize(key)
    @key = key
    @format = :text
  end

  def translate(source, target, q, options={})
    @format = :html if options[:html]
    @source, @target, @q = source, target, q
    @translated_text = request_translation
  end

  private

  def request_translation
    api = GoogleFish::Request.new(self)
    api.perform_translation
  end
end

class GoogleFish::Request
  require 'net/https'
  require 'addressable/uri'
  require 'json'
  attr_accessor :query, :response, :parsed_response

  def initialize(query)
    @query = query
  end

  def perform_translation
    @response = get
    @parsed_response = parse
  end

  private

  def query_values
    {:key => query.key, :q => query.q, :format => query.format,
      :source => query.source, :target => query.target}
  end

  def uri
    uri = Addressable::URI.new
    uri.host = 'www.googleapis.com'
    uri.path = '/language/translate/v2'
    uri.query_values = query_values
    uri.scheme = 'https'
    uri.port = 443
    uri
  end

  def get
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Get.new(uri.request_uri)
    res = http.request(req)
    raise GoogleFish::Request::ApiError unless res.code.to_i == 200
    res.body
  end

  def parse
    body = JSON.parse(response)
    body["data"]["translations"].first["translatedText"]
  end
end

class GoogleFish::Request::ApiError < Exception;end;
