RSpec.describe 'GET /pings', type: :request do
  let!(:pings) { create(:ping, time: '2020-04-14 14:00', store: 'Coop') }
  let!(:pings2) do
    create(:ping, time: '2020-04-14 10:00', store: 'Systembolaget')
  end

  describe 'user can see upcoming pings' do
    before { get '/pings' }

    it 'returns 200 response' do
      expect(response.status).to eq 200
    end

    it 'can see list of upcoming pings' do
      expect(response_json['pings'].count).to eq 2
    end

    it 'can see list of upcoming pings' do
      expect(response_json['pings'].first['store']).to eq 'Coop'
    end
  end
end
