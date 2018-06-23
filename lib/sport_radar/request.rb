# frozen_string_literal: true

module SportRadar
  module Request
    require "net/http"
    require "multi_json"

    BASE_URL = "https://api.sportradar.us"
    FORMAT_AND_API_KEY = ".json?api_key=%{api_key}"

    def get(path)
      MultiJson.load(get_response(path))
    end

    private

    def get_response(path)
      Net::HTTP.get(URI(build_url(path)))
    end

    def build_url(path)
      BASE_URL + path + FORMAT_AND_API_KEY % { api_key: api_key }
    end
  end
end
