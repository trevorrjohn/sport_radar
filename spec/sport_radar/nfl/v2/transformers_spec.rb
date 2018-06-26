# frozen_string_literal: true

RSpec.describe SportRadar::NFL::V2::Transformers do
  include described_class

  describe '#leage_to_teams' do
    it 'maps the json to teams with conference and division info' do
      json = {
        'conferences' => [{
          'name' => 'AFC',
          'divisions' => [{
            'name' => 'AFC North',
            'teams' => [{
              'id' => 'afc-north-team-id'
            }]
          }]
        },
        {
          'name' => 'NFC',
          'divisions' => [{
            'name' => 'NFC North',
            'teams' => [{
              'id' => 'nfc-north-team-id'
            }]
          },
          {
            'name' => 'NFC East',
            'teams' => [{
              'id' => 'nfc-east-team-id'
            }]
          }]
        }]
      }
      team = double :team
      allow(SportRadar::NFL::V2::Team).to receive(:new).and_return(team)

      result = league_to_teams(json)

      expect(result.size).to eq 3
      expect(result).to eq [team, team, team]
      expect(SportRadar::NFL::V2::Team).to have_received(:new).exactly(3).times
      expect(SportRadar::NFL::V2::Team).to have_received(:new).with({
        'id' => 'afc-north-team-id',
        'conference' => 'AFC',
        'division' => 'AFC North'
      })
      expect(SportRadar::NFL::V2::Team).to have_received(:new).with({
        'id' => 'nfc-north-team-id',
        'conference' => 'NFC',
        'division' => 'NFC North'
      })
      expect(SportRadar::NFL::V2::Team).to have_received(:new).with({
        'id' => 'nfc-east-team-id',
        'conference' => 'NFC',
        'division' => 'NFC East'
      })
    end
  end

  describe '#schedule_to_games' do
    it 'turns the schedule into games' do
      json = {
        'year' => 2018,
        'name' => 'REG',
        'weeks' => [{
          'sequence' => 1,
          'games' => [
            { 'id' => 'game-1-id' },
            { 'id' => 'game-2-id' }
          ]
        },
        {
          'sequence' => 2,
          'games' => [
            { 'id' => 'game-3-id' }
          ]
        }]
      }
      game = double :game
      allow(SportRadar::NFL::V2::Game).to receive(:new).and_return(game)

      result = schedule_to_games(json)

      expect(result).to eq [game, game, game]
      expect(SportRadar::NFL::V2::Game).to have_received(:new).with({
        'id' => 'game-1-id',
        'week' => 1,
        'year' => 2018,
        'season' => 'REG'
      })
      expect(SportRadar::NFL::V2::Game).to have_received(:new).with({
        'id' => 'game-2-id',
        'week' => 1,
        'year' => 2018,
        'season' => 'REG'
      })
      expect(SportRadar::NFL::V2::Game).to have_received(:new).with({
        'id' => 'game-3-id',
        'week' => 2,
        'year' => 2018,
        'season' => 'REG'
      })
    end
  end
end
