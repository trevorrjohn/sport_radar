# frozen_string_literal: true

RSpec.describe SportRadar::NBA::V4 do
  before do
    SportRadar.configure do |c|
      c.nba.v4 do |v4|
        v4.access_level = 'token'
        v4.api_key = 'nba-api-key'
      end
    end
  end

  describe '.team_roster' do
    let(:team_id) { '583ec825-fb46-11e1-82cb-f4ce4684ea4c' }

    vcr_options = { cassette_name: 'nba_v4_team_roster' }
    it 'fetches the team_roster with the id', vcr: vcr_options do
      result = described_class.team_roster(team_id)
      expect(result).to be_a SportRadar::NBA::V4::Team
      expect(result.id).to eq team_id
    end
  end
end
