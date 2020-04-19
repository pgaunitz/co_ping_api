RSpec.describe 'GET /profile/id', type: :request do
  let!(:user) { create(:user, role: 'user', community_status: 'pending') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  describe 'Can access profile page' do
    before { get "/profiles/#{user.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns ping with active pongs' do
      expect(response_json['profile']['adress']).to eq 'Baconstreet 37, floor 2'
    end

    it 'returns ping with active pongs' do
      expect(response_json['profile']['phone_number'].count).to eq '123456789'
    end

    it 'returns ping with active pongs' do
      expect(response_json['profile']['about_me'].count).to eq 'I love bacon'
    end

    it 'returns ping with active pongs' do
      expect(response_json['profile']['community_status'].count).to eq 'pending'
    end
  end
end