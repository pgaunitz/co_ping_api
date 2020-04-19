# frozen_string_literal: true

RSpec.describe 'PUT /pongs', type: :request do
  let!(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  let(:ping) { create(:ping, user_id: user.id) }
  let!(:pong) { create(:pong, ping_id: ping.id, active: true, status: 'pending') }

  describe 'can accept pong' do
    before do
      put "/pongs/#{pong.id}",
          params: {
            pong: {
              status: 'accepted',
              ping_id: ping.id
            }
          },
          headers: user_headers
    end

    it 'returns 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns updated Ping' do
      expect(Pong.all.find(pong.id).status).to eq 'accepted'
    end

    it 'returns updated Ping' do
      expect(response_json['ping']['pongs'].count).to eq 1
    end
  end

  describe 'can accept pong' do
    before do
      put "/pongs/#{pong.id}",
          params: {
            pong: {
              status: 'rejected',
              ping_id: ping.id
            }
          },
          headers: user_headers
    end

    it 'returns 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns updated Ping' do
      expect(Pong.all.find(pong.id).status).to eq 'rejected'
    end
  end
end
