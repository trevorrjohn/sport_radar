# frozen_string_literal: true

module SportRadar
  module NFL
    module V2
      module Paths
        VERSION = 2
        PREFIX = "/nfl-%{access_level}#{VERSION}"

        DAILY_CHANGE_LOG_PATH = '/league/%{year}/%{month}/%{day}/changes'
        GAME_BOXSCORE_PATH = '/games/%{game_id}/boxscore'
        GAME_ROSTER_PATH = '/games/%{game_id}/roster'
        GAME_STATISTICS_PATH = '/games/%{game_id}/statistics'
        LEAGUE_HIERARCHY_PATH = '/league/hierarchy'
        PLAY_BY_PLAY_PATH = '/games/%{game_id}/pbp'
        PLAYER_PARTICIPATION_PATH = '/plays/%{game_id}/participation'
        PLAYER_PROFILE_PATH = '/players/%{player_id}/profile'
        SCHEDULE_PATH = '/games/%{year}/%{season}/schedule'
        SEASONAL_STATISTICS_PATH = '/seasontd/%{year}/%{season}/' \
          'teams/%{team_id}/statistics'
        STANDINGS_PATH = '/seasontd/%{year}/standings'
        TEAM_PROFILE_PATH = '/teams/%{team_id}/profile'
        TEAM_ROSTER_PATH = "/teams/%{team_id}/full_roster"
        WEEKLY_SCHEDULE_PATH = '/games/%{year}/%{season}/%{week}/schedule'
        WEEKLY_INJURIES_PATH = '/seasontd/%{year}/%{season}/%{week}/injuries'
        WEEKLY_DEPTH_CHARTS_PATH = '/seasontd/%{year}/%{season}' \
          '/%{week}/depth_charts'

        def daily_change_log_path(year, month, day)
          build_path(DAILY_CHANGE_LOG_PATH,
                     { year: year, month: month, day: day })
        end

        def game_boxscore_path(game_id)
          build_path(GAME_BOXSCORE_PATH, { game_id: game_id })
        end

        def game_roster_path(game_id)
          build_path(GAME_ROSTER_PATH, { game_id: game_id })
        end

        def game_statistics_path(game_id)
          build_path(GAME_STATISTICS_PATH, { game_id: game_id })
        end

        def league_hierarchy_path
          build_path(LEAGUE_HIERARCHY_PATH)
        end

        def play_by_play_path(game_id)
          build_path(PLAY_BY_PLAY_PATH, { game_id: game_id })
        end

        def player_participation_path(game_id)
          build_path(PLAYER_PARTICIPATION_PATH, { game_id: game_id })
        end

        def player_profile_path(player_id)
          build_path(PLAYER_PROFILE_PATH, { player_id: player_id })
        end

        def schedule_path(year, season)
          build_path(SCHEDULE_PATH, { year: year, season: season })
        end

        def seasonal_statistics_path(year, season)
          build_path(SEASONAL_STATISTICS_PATH,
                     { year: year, season: season })
        end

        def standings_path(year)
          build_path(STANDINGS_PATH, { year: year })
        end

        def team_profile_path(team_id)
          build_path(TEAM_PROFILE_PATH, { team_id: team_id })
        end

        def team_roster_path(team_id)
          build_path(TEAM_ROSTER_PATH, { team_id: team_id })
        end

        def weekly_schedule_path(year, season, week)
          build_path(WEEKLY_SCHEDULE_PATH,
                     { year: year, season: season, week: week })
        end

        def weekly_injuries_path(year, season, week)
          build_path(WEEKLY_INJURIES_PATH,
                     { year: year, season: season, week: week })
        end

        def weekly_depth_charts_path(year, season, week)
          build_path(WEEKLY_DEPTH_CHARTS_PATH,
                     { year: year, season: season, week: week })
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
          SportRadar.config.nfl.v2
        end
      end
    end
  end
end
