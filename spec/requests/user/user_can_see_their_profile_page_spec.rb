RSpec.describe 'GET /profile/id', type: :request do
  describe 'Can access profile page' do
    let!(:user) { create(:user, role: 'user', community_status: 'pending') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    before { get "/profiles/#{user.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns user address' do
      expect(response_json['user']['address']).to eq 'Baconstreet 37, floor 2'
    end

    it 'returns user phone number' do
      expect(response_json['user']['phone_number']).to eq '123456789'
    end

    it 'returns about me' do
      expect(response_json['user']['about_me']).to eq 'I love bacon'
    end

    it 'returns community status' do
      expect(response_json['user']['community_status']).to eq 'pending'
    end
  end

  describe 'Can access profile page' do
    let!(:user) { create(:user, role: 'user', community_status: 'accepted') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    before { get "/profiles/#{user.id}", headers: user_headers }

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns users community' do
      expect(response_json['user']['community']).to eq 'First Community'
    end
  end

  describe 'without valid credentials' do
    let!(:user) { create(:user, role: 'user', community_status: 'accepted') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    before { get "/profiles/#{user.id}", headers: headers }

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(
        response_json['errors'].first
      ).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
