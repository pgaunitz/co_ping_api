# frozen_string_literal: true

RSpec.describe 'POST /pongs', type: :request do
  describe 'with valid credentials' do
    
    let(:user) { create(:user, role: 'user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    
    describe 'can create pong' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params:
             { pong:
              {
                item1: 'Bacon',
                item2: 'Butter',
                item3: 'Schampoo',
                ping_id: ping.id,
                user_id: user.id
              } },
             headers: user_headers
      end

      it 'returns response status 200' do
        expect(response.status).to eq 200
      end

      it 'successfully creates pong' do
        expect(response_json['message']).to eq 'Your request was added to this trip'
      end

      it 'pong belongs to ping' do
        expect(Pong.last.ping_id).to eq ping.id
      end
    end

    describe 'can create pong with one item' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params:
             { pong:
              {
                item1: 'Bacon',
                item2: nil,
                item3: nil,
                ping_id: ping.id,
                user_id: user.id
              } },
             headers: user_headers
      end

      it 'returns response status 200' do
        expect(response.status).to eq 200
      end

      it 'successfully creates pong' do
        expect(response_json['message']).to eq 'Your request was added to this trip'
      end

      it 'pong belongs to ping' do
        expect(Pong.last.ping_id).to eq ping.id
      end
    end

    describe 'cannot create pong to inactive ping' do
      let(:ping) { create(:ping, active: false) }
      before do
        post '/pongs',
             params:
             { pong:
              {
                item1: 'Bacon',
                item2: nil,
                item3: nil,
                ping_id: ping.id,
                user_id: user.id
              } },
             headers: user_headers
      end

      it 'returns response status 422' do
        expect(response.status).to eq 422
      end

      it 'cannot create pong to inactive ping' do
        expect(response_json['message']).to eq 'This trip is no longer active'
      end
    end

  
  end
end