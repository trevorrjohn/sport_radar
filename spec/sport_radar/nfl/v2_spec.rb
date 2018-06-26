# frozen_string_literal: true

RSpec.describe SportRadar::NFL::V2 do
  before do
    SportRadar.configure do |c|
      c.nfl.v2 do |v2|
        v2.access_level = 'token'
        v2.api_key = 'api-key'
      end
    end
  end

  # describe '.daily_change_log' do
    # result = described_class.daily_change_log(year, month, day)
  # end

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

  # describe '.play_by_play' do
    # result = described_class.play_by_play(game_id)
  # end

  # describe '.player_participation' do
    # result = described_class.player_participation(game_id)
  # end

  # describe '.player_profile' do
    # result = described_class.player_profile(player_id)
  # end

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

  # describe '.seasonal_statistics' do
    # result = described_class.seasonal_statistics(year, season)
  # end

  # describe '.standings' do
    # result = described_class.standings(year)
  # end

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

    vcr_options = { cassette_name: 'nfl_v2_team_roster' }
    it 'fetches the team_roster with the id', vcr: vcr_options do
      result = described_class.team_roster(team_id)
      expect(result).to be_a SportRadar::NFL::V2::Team
      expect(result.id).to eq team_id
    end
  end

  # describe '.weekly_schedule' do
    # result = described_class.weekly_schedule(year, season, week)
  # end

  # describe '.weekly_injuries' do
    # result = described_class.weekly_injuries(year, season, week)
  # end

  # describe '.weekly_depth_charts' do
    # result = described_class.weekly_depth_charts(year, season, week)
  # end
end
