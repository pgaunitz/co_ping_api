RSpec.describe 'GET /pings', type: :request do
  let(:ping) { create(:ping, time: '2020-04-14 14:00', store: 'Coop') }
  let(:ping2) { create(:ping, time: '2020-04-14 10:00', store: 'Systembolaget') }

  describe 'user can see upcoming pings' do
    before do
      get '/pings'
    end

    it 'returns 200 response' do
      expect(response.status).to eq 200
    end

    it 'can see list of upcoming pings' do
      expect(reponse_json['pings'].count).to eq 2
    end

    it 'can see list of upcoming pings' do
      expect(reponse_json['pings'].first['store']).to eq 'Coop'
    end
  end
end