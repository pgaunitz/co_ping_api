RSpec.describe 'PUT /pings', type: :request  do
  let(:ping) { create(:ping, user_id: user.id) }
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  describe 'user PUT a ping' do
    before do
      put "/pings/#{ping.id}",
        params: 
        { ping: 
          { active: false,
            ping_id: ping.id, 
            user_id: user.id 
          } 
        },
        headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'Your trip is now closed for more requests'
    end

    it 'sets active from true to false' do
      expect(Ping.all.find(ping.id).active).to eq false
    end

  end
end