# frozen_string_literal: true

RSpec.describe 'GET /pings', type: :request do
  describe 'with valid credentials' do
    let(:user) { create(:user, role: 'user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    describe 'user can see upcoming pings' do
      let!(:pings) { create(:ping, time: '2020-04-14 14:00', store: 'Coop') }
      let!(:pings2) do
        create(:ping, time: '2020-04-14 10:00', store: 'Systembolaget')
      end
      let!(:pings3) do
        create(:ping, time: '2020-04-12 15:00', store: 'Ica', active: false)
      end
      before { get '/pings', headers: user_headers }

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
      let!(:pings) do
        create(:ping, time: '2020-04-14 14:00', store: 'Coop', active: false)
      end

      before { get '/pings', headers: user_headers }

      it 'returns message about no active pings' do
        expect(
          response_json['message']
        ).to eq 'Unfortunately no one has planned to go shopping, so maybe you can?'
      end
    end
  end
  describe 'without valid credentials' do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    before { get '/pings', headers: headers }

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end
    
    it 'returns success message' do
      expect(
        response_json['errors'].first
      ).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
