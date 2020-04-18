# frozen_string_literal: true

RSpec.describe 'PUT /pings', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  describe 'user PUT a ping' do
    let(:ping) { create(:ping, user_id: user.id) }

    before do
      put "/pings/#{ping.id}",
          params:
          { ping:
            { active: false,
              user_id: user.id } },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns success message' do
      expect(response_json['message']).to eq "You are ready to go shopping, don't forget the receipts!"
    end

    it 'sets active from true to false' do
      expect(Ping.all.find(ping.id).active).to eq false
    end
  end
  describe 'user tries to update other users ping' do
    let(:ping) { create(:ping) }

    before do
      put "/pings/#{ping.id}",
          params:
          { ping:
            { active: false,
              user_id: user.id } },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns success message' do
      expect(response_json['message']).to eq "You are not authorized to update another user's ping"
    end

    it 'sets active from true to false' do
      expect(Ping.all.find(ping.id).active).to eq true
    end
  end
end
