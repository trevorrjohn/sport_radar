# frozen_string_literal: true

require "sport_radar/nba/v4/paths"
require "sport_radar/nba/v4/team"

module SportRadar
  module NBA
    module V4
      class << self
        include paths
        include request

        def team_roster(team_id)
          Team.new(get(team_roster_path(team_id)))
        end

        def daily_change_log(year, month, day)
          get(daily_change_log_path(year, month, day))
        end

        def daily_schedule(year, month, day)
          get(daily_schedule_path(year, month, day))
        end

        def daily_transfers(year, month, day)
          get(daily_transfers_path(year, month, day))
        end

        def free_agents
          get(free_agents_path)
        end

        def game_boxscore(game_id)
          Game.new(get(game_boxscore_path(game_id)))
        end

        def game_summary(game_id)
          Game.new(get(game_summary_path(game_id)))
        end

        def injuries
          get(injuries_path)
        end

        def league_leaders(year, type)
          get(league_leaders_path(year, type))
        end

        def play_by_play(game_id)
          Game.new(get(play_by_play_path(game_id)))
        end

        def player_profile(player_id)
          get(player_profile_path(player_id))
        end

        def rankings(year, type)
          get(rankings_path(year, type))
        end

        def schedule(year, type)
          get(schedule_path(year, type))
        end

        def seasonal_statistics_path(year, type)
          get(seasonal_statistics_path(year, type))
        end

        def series_schedule(year, type)
          get(series_schedule_path(year, type))
        end

        def series_statistics(series_id, team_id)
          get(series_statistics_path(series_id, team_id))
        end

        def standings(year, type)
          get(standings_path(year, type))
        end
      end
    end
  end
end
