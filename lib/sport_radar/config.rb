# frozen_string_literal: true

module SportRadar
  class Config

    class ArgumentError < StandardError
    end

    def nfl
      @nfl ||= Sport.new('NFL', 2)
      yield(@nfl) if block_given?
      @nfl
    end

    def nba
      @nba ||= Sport.new('NBA', 4)
      yield(@nba) if block_given?
      @nba
    end

    class Sport
      attr_reader :sport

      def initialize(sport, *versions)
        @sport = sport
        versions.each do |version|
          version_name = "v#{version}"
          instance_variable_set(
            "@#{version_name}", Version.new(sport, version))

          self.class.define_method(version_name.to_sym) do |&block|
            instance_variable_get("@#{version_name}").tap do |ivar|
              block.call(ivar) if block
            end
          end
        end
      end
    end

    class Version
      API_KEY = "%{sport}_V%{version}_SPORT_RADAR_API_KEY"
      ACCESS_LEVEL = "%{sport}_V%{version}_SPORT_RADAR_ACCESS_LEVEL"

      attr_reader :sport, :version
      attr_writer :api_key, :access_level

      def initialize(sport, version)
        @sport = sport
        @version = version
      end

      def api_key
        ENV.fetch(API_KEY % { sport: sport, version: version }, @api_key)
      end

      def access_level
        ENV.fetch(
          ACCESS_LEVEL % { sport: sport, version: version },
          @access_level
        )
      end
    end
  end
end
