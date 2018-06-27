# frozen_string_literal: true

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<NFL_SPORT_RADAR_V2_API_KEY>") do
    SportRadar.config.nfl.v2.api_key
  end
  config.filter_sensitive_data("<NFL_SPORT_RADAR_V2_ACCESS_LEVEL>") do
    SportRadar.config.nfl.v2.access_level
  end
end
