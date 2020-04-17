# frozen_string_literal: true

RSpec.describe 'GET /pings/:id', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  let(:ping) { create(:ping, user_id: user.id) }
  let!(:pong) { create(:pong, ping_id: ping.id, active: false) }

  describe 'Can see pongs that belongs to their ping' do
    let!(:pong2) { create(:pong, ping_id: ping.id, active: true, status: 'accepted') }
    let!(:pong3) { create(:pong, ping_id: ping.id, active: true, status: 'accepted') }
    
    before { get "/pings/#{ping.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns ping with active pongs' do
      expect(response_json['ping']['id']).to eq ping.id
    end

    it 'returns ping with active pongs' do
      expect(response_json['ping']['pongs'].count).to eq 2
    end

    it 'return name of pong owner' do
      expect(response_json['ping']['pongs'].first['user_name']).to eq 'Betty'
    end
  end

  describe 'user get message that there is no pongs' do

    before { get "/pings/#{ping.id}", headers: user_headers }
    
    it 'returns messege' do
      expect(response_json['message']).to eq 'Your shopping bag looks light!'
    end
  end
end
