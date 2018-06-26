# frozen_string_literal: true

require "sport_radar/version"
require "sport_radar/config"
require "sport_radar/request"
require "sport_radar/nfl/v2"
require "sport_radar/nfl"

module SportRadar
  class << self
    attr_accessor :config
  end

  def self.configure
    @config ||= Config.new
    yield(config)
  end
end
