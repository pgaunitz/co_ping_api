# frozen_string_literal: true

RSpec.describe 'GET /pings', type: :request do
  describe 'user can see upcoming pings' do
    let!(:pings) { create(:ping, time: '2020-04-14 14:00', store: 'Coop') }
    let!(:pings2) { create(:ping, time: '2020-04-14 10:00', store: 'Systembolaget') }
    let!(:pings3) { create(:ping, time: '2020-04-12 15:00', store: 'Ica', active: false) }

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

    it 'does not see pings that are not active' do
      expect(response_json['pings'].last['time']).to eq '2020-04-14 10:00'
    end
  end

  describe 'receives message if there are no pings' do
    let!(:pings) { create(:ping, time: '2020-04-14 14:00', store: 'Coop', active: false) }

    before { get '/pings' }

    it 'returns message about no active pings' do
      expect(response_json['message']).to eq 'Unfortunately no one has planned to go shopping, so maybe you can?'
    end
  end
end
