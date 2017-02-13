## base class for v1 of API
module CongressApi
  class V1
    include HTTParty
    parser Class.new(HTTParty::Parser) { include MashedParser }
    base_uri 'api.propublica.org/congress/v1'

    def initialize
      self.class.headers 'X-API-Key' => ENV['CONGRESS_API_KEY']
    end

    def v1
      @_v1 ||= self.class
    end
  end
end