# frozen_string_literal: true

module SportRadar
  module NFL
    module V2
      module Transformers
        def league_to_teams(json)
          json['conferences'].flat_map do |conference_json|
            conference_json['divisions'].flat_map do |division_json|
              division_json['teams'].flat_map do |team_json|
                Team.new(team_json.merge({
                  'conference' => conference_json['name'],
                  'division' => division_json['name']
                }))
              end
            end
          end
        end

        def schedule_to_games(json)
          json['weeks'].flat_map do |week_json|
            week_json['games'].flat_map do |game_json|
              Game.new(game_json.merge({
                'week' => week_json['sequence'],
                'season' => json['name'],
                'year' => json['year']
              }))
            end
          end
        end
      end
    end
  end
end
