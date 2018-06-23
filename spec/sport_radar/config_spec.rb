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
    end
  end

  subject { SportRadar.config }

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
        context 'when environment variable set' do
          it 'reads environment variable' do
            ENV['NFL_V2_SPORT_RADAR_API_KEY'] = 'env-key'
            expect(subject.nfl.v2.api_key).to eq 'env-key'
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
            ENV['NFL_V2_SPORT_RADAR_ACCESS_LEVEL'] = 'env-level'
            expect(subject.nfl.v2.access_level).to eq 'env-level'
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
