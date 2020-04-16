# frozen_string_literal: true

RSpec.describe 'post /pings', type: :request do
  describe 'with valid credentials' do
    let(:user) { create(:user, role: 'user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    describe 'user POST a ping' do
      before do
        post '/pings',
             params: { ping: { time: '2020-04-31-15:00', store: 'ica', user_id: user.id } },
             headers: user_headers
      end

      it 'returns a 200 response status' do
        expect(response).to have_http_status 200
      end
      
      it 'returns success message' do
        expect(response_json['message']).to eq 'Your new trip is now active'
      end
    end

    describe 'user POST a ping without store' do
      before do
        post '/pings',
             params: { ping: { time: '2020-04-31-15:00', user_id: user.id } },
             headers: user_headers
      end

      it 'returns a 200 response status' do
        expect(response).to have_http_status 200
      end

      it 'returns success message' do
        expect(response_json['message']).to eq 'Your new trip is now active'
      end
    end

    describe 'user POST a ping without time' do
      before do
        post '/pings', params: { ping: { store: 'Ica', user_id: user.id } }, 
        headers: user_headers
      end

      it 'returns error message' do
        expect(
          response_json['message']
        ).to eq 'You need to set a time for your new trip'
      end
    end
  end

  describe 'without valid credentials' do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    before do
      post '/pings',
           params: { ping: { time: '2020-04-31-15:00', store: 'ica' } },
           headers: headers
    end

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns success message' do
      expect(response_json['errors'].first).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
