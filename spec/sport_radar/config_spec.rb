# frozen_string_literal: true

require 'spec_helper'

RSpec.describe SportRadar::Config do
  before do
    SportRadar.configure do |c|
      c.nfl do |nfl|
        nfl.v2 do |v|
          v.api_key = 'nfl-key'
          v.access_level = 'nfl-level'
        end
      end
      c.nba do |nba|
        nba.v4 do |v|
          v.api_key = 'nba-key'
          v.access_level = 'nba-level'
        end
      end
    end
  end

  subject { SportRadar.config }

  describe '#nba' do
    describe '#v4' do
      describe '#version' do
        context 'when version set' do
          it 'returns the version' do
            expect(subject.nba.v4.version).to eq 4
          end
        end
      end

      describe '#api_key' do
        around do |spec|
          api_key_env = ENV.delete('NBA_V4_SPORT_RADAR_API_KEY')
          access_level_env = ENV.delete('NBA_V4_SPORT_RADAR_ACCESS_LEVEL')
          spec.run
          ENV['NBA_V4_SPORT_RADAR_API_KEY'] = api_key_env
          ENV['NBA_V4_SPORT_RADAR_ACCESS_LEVEL'] = access_level_env
        end

        context 'when environment variable set' do
          it 'reads environment variable' do
            ENV['NBA_V4_SPORT_RADAR_API_KEY'] = 'nba-env-key'
            expect(subject.nba.v4.api_key).to eq 'nba-env-key'
            ENV.delete('NBA_V4_SPORT_RADAR_API_KEY')
          end
        end

        context 'when no environment variable set' do
          it 'reads from the config file' do
            expect(subject.nba.v4.api_key).to eq 'nba-key'
          end
        end
      end

      describe '#access_level' do
        context 'when environment variable set' do
          it 'reads environment variable' do
            ENV['NBA_V4_SPORT_RADAR_ACCESS_LEVEL'] = 'nba-env-level'
            expect(subject.nba.v4.access_level).to eq 'nba-env-level'
            ENV.delete('NBA_V4_SPORT_RADAR_ACCESS_LEVEL')
          end
        end

        context 'when no environment variable set' do
          it 'reads from the config file' do
            expect(subject.nba.v4.access_level).to eq 'nba-level'
          end
        end
      end
    end
  end

  describe '#nfl' do
    describe '#v2' do
      describe '#version' do
        context 'when version set' do
          it 'returns the version' do
            expect(subject.nfl.v2.version).to eq 2
          end
        end
      end

      describe '#api_key' do
        around do |spec|
          api_key_env = ENV.delete('NFL_V2_SPORT_RADAR_API_KEY')
          access_level_env = ENV.delete('NFL_V2_SPORT_RADAR_ACCESS_LEVEL')
          spec.run
          ENV['NFL_V2_SPORT_RADAR_API_KEY'] = api_key_env
          ENV['NFL_V2_SPORT_RADAR_ACCESS_LEVEL'] = access_level_env
        end

        context 'when environment variable set' do
          it 'reads environment variable' do
            ENV['NFL_V2_SPORT_RADAR_API_KEY'] = 'nfl-env-key'
            expect(subject.nfl.v2.api_key).to eq 'nfl-env-key'
            ENV.delete('NFL_V2_SPORT_RADAR_API_KEY')
          end
        end

        context 'when no environment variable set' do
          it 'reads from the config file' do
            expect(subject.nfl.v2.api_key).to eq 'nfl-key'
          end
        end
      end

      describe '#access_level' do
        context 'when environment variable set' do
          it 'reads environment variable' do
            ENV['NFL_V2_SPORT_RADAR_ACCESS_LEVEL'] = 'nfl-env-level'
            expect(subject.nfl.v2.access_level).to eq 'nfl-env-level'
            ENV.delete('NFL_V2_SPORT_RADAR_ACCESS_LEVEL')
          end
        end

        context 'when no environment variable set' do
          it 'reads from the config file' do
            expect(subject.nfl.v2.access_level).to eq 'nfl-level'
          end
        end
      end
    end
  end
end
