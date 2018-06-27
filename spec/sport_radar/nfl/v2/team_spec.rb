# frozen_string_literal: true

require "spec_helper"

RSpec.describe SportRadar::NFL::V2::Team do
  before do
    SportRadar.configure do |c|
      c.nfl.v2 do |v2|
        v2.access_level = 'token'
        v2.api_key = 'api-key'
      end
    end
  end

  describe '.game_boxscore' do
    let(:game_id) { 'b1dbf64f-822a-49b7-9bf3-070f5d6da827' }

    vcr_options = { cassette_name: 'nfl_v2_game_boxscore' }
    it 'fetches the .game_boxscore with the id', vcr: vcr_options do
      result = described_class.game_boxscore(game_id)
      expect(result).to be_a SportRadar::NFL::V2::Game
      expect(result.id).to eq game_id
    end
  end

  describe '.team_profile' do
    let(:team_id) { '33405046-04ee-4058-a950-d606f8c30852' }

    vcr_options = { cassette_name: 'nfl_v2_team_profile' }
    it 'fetches the team_profile with the id', vcr: vcr_options do
      result = described_class.team_profile(team_id)
      expect(result).to be_a SportRadar::NFL::V2::Team
      expect(result.id).to eq team_id
    end
  end

  describe '.game_roster' do
    let(:game_id) { 'b1dbf64f-822a-49b7-9bf3-070f5d6da827' }

    vcr_options = { cassette_name: 'nfl_v2_game_roster' }
    it 'fetches the .game_roster with the id', vcr: vcr_options do
      result = described_class.game_roster(game_id)
      expect(result).to be_a SportRadar::NFL::V2::Game
      expect(result.id).to eq game_id
    end
  end

  describe '.game_boxscore' do
    let(:game_id) { 'b1dbf64f-822a-49b7-9bf3-070f5d6da827' }

    vcr_options = { cassette_name: 'nfl_v2_game_boxscore' }
    it 'fetches the .game_boxscore with the id', vcr: vcr_options do
      result = described_class.game_boxscore(game_id)
      expect(result).to be_a SportRadar::NFL::V2::Game
      expect(result.id).to eq game_id
    end
  end

  describe '.game_statistics' do
    let(:game_id) { 'b1dbf64f-822a-49b7-9bf3-070f5d6da827' }

    vcr_options = { cassette_name: 'nfl_v2_game_statistics' }
    it 'fetches the .game_statistics with the id', vcr: vcr_options do
      result = described_class.game_statistics(game_id)
      expect(result).to be_a SportRadar::NFL::V2::Game
      expect(result.id).to eq game_id
    end
  end

  describe '.league_hierarchy' do
    vcr_options = { cassette_name: 'nfl_v2_league_hierarchy' }
    it 'fetches the .league_hierarchy and transforms into teams', vcr: vcr_options do
      result = described_class.league_hierarchy
      expect(result.map(&:class).uniq).to eq [SportRadar::NFL::V2::Team]
      expect(result.size).to eq 32
    end
  end

  describe '.schedule' do
    vcr_options = { cassette_name: 'nfl_v2_schedule' }
    it 'fetches the .schedule and transforms into games', vcr: vcr_options do
      year = 2017
      season = :REG
      result = described_class.schedule(year, season)
      expect(result.map(&:class).uniq).to eq [SportRadar::NFL::V2::Game]
      expect(result.size).to eq 257
    end
  end

  describe '.team_profile' do
    let(:team_id) { '33405046-04ee-4058-a950-d606f8c30852' }

    vcr_options = { cassette_name: 'nfl_v2_team_profile' }
    it 'fetches the team_profile with the id', vcr: vcr_options do
      result = described_class.team_profile(team_id)
      expect(result).to be_a SportRadar::NFL::V2::Team
      expect(result.id).to eq team_id
    end
  end

  describe '.team_roster' do
    let(:team_id) { '33405046-04ee-4058-a950-d606f8c30852' }
    let(:team) { SportRadar::NFL::V2.team_roster(team_id) }

    vcr_options = { cassette_name: 'nfl_v2_team_roster' }
    it 'fetches the team_roster with the id', vcr: vcr_options do
      expect(team).to be_a SportRadar::NFL::V2::Team
      expect(team.id).to eq team_id
      expect(team.name).to eq "Vikings"
      expect(team.market).to eq "Minnesota"
      expect(team.alias).to eq "MIN"
      expect(team.franchise).to eq "MIN"
      expect(team.coaches).to eq "MIN"
      expect(team.venue).to eq "MIN"
      expect(team.division).to eq "MIN"
      expect(team.conference).to eq "MIN"
      expect(team.players).to eq "MIN"
    end
  end
end
