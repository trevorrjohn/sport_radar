# frozen_string_literal: true

RSpec.describe SportRadar::Request do
  class Subject
    include SportRadar::Request

    def api_key
      "my-key"
    end
  end

  describe '#get' do
    it 'builds the path and adds the api key' do
      subject = Subject.new
      json = '{"my_json":"body"}'
      allow(Net::HTTP).to receive(:get).and_return(json)

      response = subject.get('/example')

      expect(response).to eq("my_json" => "body")
      uri = URI(SportRadar::Request::BASE_URL + "/example.json?api_key=my-key")
      expect(Net::HTTP).to have_received(:get)
        .with(uri)
    end
  end
end
