## mixin for returning httparty results as a Hashie::Mash
module CongressApi
  module MashedParser
    protected
    def json
      mashed(super)
    end

    private
    def mashed thing
      if thing.is_a? Hash
        Hashie::Mash.new thing
      elsif thing.is_a? Array
        thing.map &method(:mashed)
      else
        thing
      end
    end
  end
end