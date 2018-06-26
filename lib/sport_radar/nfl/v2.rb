# frozen_string_literal: true

require "sport_radar/nfl/v2/paths"
require "sport_radar/nfl/v2/transformers"
require "sport_radar/nfl/v2/team"
require "sport_radar/nfl/v2/game"

module SportRadar
  module NFL
    module V2
      class << self
        include Paths, Request, Transformers

        def daily_change_log(year, month, day)
          get(daily_change_log_path(year, month, day))
        end

        def game_boxscore(game_id)
          Game.new(get(game_boxscore_path(game_id)))
        end

        def game_roster(game_id)
          Game.new(get(game_roster_path(game_id)))
        end

        def game_statistics(game_id)
          Game.new(get(game_statistics_path(game_id)))
        end

        def league_hierarchy
          league_to_teams(get(league_hierarchy_path))
        end

        def play_by_play(game_id)
          get(play_by_play_path(game_id))
        end

        def player_participation(game_id)
          get(player_participation_path(game_id))
        end

        def player_profile(player_id)
          get(player_profile_path(player_id))
        end

        def schedule(year, season)
          schedule_to_games(get(schedule_path(year, season)))
        end

        def seasonal_statistics(year, season)
          get(seasonal_statistics_path(year, season))
        end

        def standings(year)
          get(standings_path(year))
        end

        def team_profile(team_id)
          Team.new(get(team_profile_path(team_id)))
        end

        def team_roster(team_id)
          Team.new(get(team_roster_path(team_id)))
        end

        def weekly_schedule(year, season, week)
          get(weekly_schedule_path(year, season, week))
        end

        def weekly_injuries(year, season, week)
          get(weekly_injuries_path(year, season, week))
        end

        def weekly_depth_charts(year, season, week)
          get(weekly_depth_charts_path(year, season, week))
        end
      end
    end
  end
end
