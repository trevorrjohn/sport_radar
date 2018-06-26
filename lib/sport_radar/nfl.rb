# frozen_string_literal: true

require 'forwardable'

module SportRadar
  module NFL
    class << self
      extend Forwardable
      delegate %i[
        game_boxscore
        game_roster
        game_statistics
        league_hierarchy
        schedule
        team_profile
        team_roster
        team_roster
      ] => :'SportRadar::NFL::V2'
    end
  end
end

