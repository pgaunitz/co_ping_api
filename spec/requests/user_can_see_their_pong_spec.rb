RSpec.describe 'GET /pongs', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  
  describe 'can see last pong' do
    let!(:pong) { create(:pong, item1: 'smör', user_id: user.id)  }

    before { get "/pongs/#{user.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'return last pong' do
      expect(response_json['pong']['item1']).to eq 'smör'
    end
  end

  describe 'returns message if there are no pongs' do
    before { get "/pongs/#{user.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'return last pong' do
      expect(response_json['message']).to eq 'You have not requested anything from a neighbour'
    end
  end
end