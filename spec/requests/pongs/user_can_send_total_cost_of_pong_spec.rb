RSpec.describe 'PUT /pongs/id', type: :request do
  let!(:user) { create(:user, role: 'user', community_status: 'accepted') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  let!(:pong) { create(:pong, active: false, status: 'accepted') }

  describe 'user can add total cost' do
    before do
      put "/pongs/#{pong.id}",
          params: {
            pong: {
              total_cost: '123'
            }
          },
          headers: user_headers
    end

    it 'returns 200 response' do
      expect(response).to have_http_status 200
    end

    it 'returns message ' do
      expect(response_json['message']).to eq 'The total amount was sent to your neighbour'
    end

    it 'changes the total cost' do
      expect(Pong.all.find(pong.id).total_cost).to eq '123'
    end
  end
end