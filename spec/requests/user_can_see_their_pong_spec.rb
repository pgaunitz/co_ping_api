RSpec.describe 'GET /pongs', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  let!(:pong) { create(:pong, item1: 'smör', user_id: user.id)  }
  
  describe 'can see last pong' do
    
    before { get "/pongs/#{user.id}", headers: user_headers }

    it 'return last pong' do
      expect(response_json['pong']['item1']).to eq 'smör'
    end
  end
end