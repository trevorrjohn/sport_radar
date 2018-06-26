# frozen_string_literal: true

module SportRadar
  module NBA
    module V4
      module Paths
        VERSION = 4
        PREFIX = "/nba/%{access_level}/v#{VERSION}/en"

        TEAM_ROSTER_PATH = "/teams/%{team_id}/profile"
        DAILY_CHANGE_LOG_PATH = '/league/%{year}/%{month}/%{day}/changes'
        DAILY_SCHEDULE_PATH = '/games/%{year}/%{month}/%{day}/schedule'
        DAILY_TRANSFERS_PATH = '/league/%{year}/%{month}/%{day}/transfers'
        FREE_AGENTS_PATH = '/league/free_agents'
        GAME_BOXSCORE_PATH = '/games/%{game_id}/boxscore'
        GAME_SUMMARY_PATH = '/games/%{game_id}/summary'
        INJURIES_PATH = '/league/injuries'
        LEAGUE_HIERARCHY_PATH = '/league/hierarchy'
        LEAGUE_LEADERS_PATH = '/seasons/%{year}/%{type}/leaders'
        PLAY_BY_PLAY_PATH = '/games/%{game_id}/pbp'
        PLAYER_PROFILE_PATH = '/players/%{player_id}/profile'
        RANKINGS_PATH = '/seasons/%{year}/%{type}/rankings'
        SCHEDULE_PATH = '/games/%{year}/%{type}/schedule'
        SEASONAL_STATISTICS_PATH = '/seasons/%{year}/%{type}/teams/%{team_id}/statistics'
        SERIES_SCHEDULE_PATH = '/series/%{year}/%{type}/schedule'
        SERIES_STATISTICS_PATH = '/series/%{series_id}/teams/%{team_id}/statistics'
        STANDINGS_PATH = '/seasons/%{year}/%{type}/standings'

        def team_roster_path(team_id)
          build_path(TEAM_ROSTER_PATH, { team_id: team_id })
        end

        def daily_change_log_path(year, month, day)
          build_path(DAILY_CHANGE_LOG_PATH,
                     { year: year, month: month, day: day })
        end

        def daily_schedule_path(year, month, day)
          build_path(DAILY_SCHEDULE_PATH,
                     { year: year, month: month, day: day })
        end

        def daily_transfers_path(year, month, day)
          build_path(DAILY_TRANSFERS_PATH,
                     { year: year, month: month, day: day })
        end

        def free_agents_path
          build_path(FREE_AGENTS_PATH)
        end

        def game_boxscore_path(game_id)
          build_path(GAME_BOXSCORE_PATH, { game_id: game_id })
        end

        def game_summary_path(game_id)
          build_path(GAME_SUMMARY_PATH, { game_id: game_id })
        end

        def injuries_path
          build_path(INJURIES_PATH)
        end

        def league_leaders_path(year, type)
          build_path(LEAGUE_LEADERS_PATH, { year: year, type: type })
        end

        def play_by_play_path(game_id)
          build_path(PLAY_BY_PLAY_PATH, { game_id: game_id })
        end

        def player_profile_path(player_id)
          build_path(PLAYER_PROFILE_PATH, { player_id: player_id })
        end

        def rankings_path(year, type)
          build_path(RANKINGS_PATH, { year: year, type: type })
        end

        def schedule_path(year, type)
          build_path(SCHEDULE_PATH, { year: year, type: type })
        end

        def seasonal_statistics_path(year, type)
          build_path(SEASONAL_STATISTICS_PATH, { year: year, type: type })
        end

        def series_schedule_path(year, type)
          build_path(SERIES_SCHEDULE_PATH, { year: year, type: type })
        end

        def series_statistics_path(series_id, team_id)
          build_path(SERIES_STATISTICS_PATH,
                     { series_id: series_id, team_id: team_id })
        end

        def standings_path(year, type)
          build_path(STANDINGS_PATH, { year: year, type: type })
        end

        def build_path(path, options = {})
          (PREFIX + path) % { access_level: access_level }.merge!(options)
        end

        def access_level
          config.access_level
        end

        def api_key
          config.api_key
        end

        def config
          SportRadar.config.nba.v4
        end
      end
    end
  end
end
