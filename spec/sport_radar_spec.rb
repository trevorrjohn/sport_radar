# frozen_string_literal: true

RSpec.describe SportRadar do
  it "has a version number" do
    expect(SportRadar::VERSION).not_to be nil
  end

  describe '.config' do
    it 'is a Config' do
      described_class.configure { |_| }
      expect(described_class.config).to be_a SportRadar::Config
    end
  end
end
