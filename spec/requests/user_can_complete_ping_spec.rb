RSpec.describe 'PUT /pings', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  let(:ping) { create(:ping, user_id: user.id) }
  let!(:pong) { create(:pong, ping_id: ping.id, active: true, status: 'accepted') }
  
  describe 'complete trip' do
    before do
    put "/pings/#{ping.id}",
          params: {
            ping: {
              completed: true,
            }
          },
          headers: user_headers
    end
    
    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns message trip complete' do
      expect(response_json['message']).to eq 'Your trip is completed'
    end

    it 'returns ping with active pongs' do
      expect(Ping.find(ping.id).completed).to eq true
    end
  end
end