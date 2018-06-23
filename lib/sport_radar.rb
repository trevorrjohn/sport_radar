# frozen_string_literal: true

require "sport_radar/version"
require "sport_radar/config"
require "sport_radar/request"

module SportRadar
  class << self
    attr_accessor :config
  end

  def self.configure
    @config ||= Config.new
    yield(config)
  end
end
