# frozen_string_literal: true

RSpec.describe 'POST /auth/sign_in', type: :request do
  let(:admin) { create(:user, role: 'admin') }
  let(:admin_credentials) { admin.create_new_auth_token }
  let(:admin_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(admin_credentials)
  end

  let(:user) { create(:user, role: 'user') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end

  describe 'with valid admin credentials' do
    let(:expected_response) do
      {
        'data' => {
          'id' => admin.id,
          'uid' => admin.email,
          'email' => admin.email,
          'provider' => 'email',
          'allow_password_change' => true,
          'role' => 'admin',
          'name' => admin.name,
          'community_id' => admin.community.id,
          'community_status' => 'accepted'
        }
      }
    end

    before do
      post '/auth/sign_in',
           params: { email: admin.email, password: admin.password },
           headers: admin_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns expected response' do
      expect(response_json).to eq expected_response
    end
  end

  describe 'with valid user credentials' do
    let(:expected_response) do
      {
        'data' => {
          'id' => user.id,
          'uid' => user.email,
          'email' => user.email,
          'provider' => 'email',
          'allow_password_change' => true,
          'role' => 'user',
          'name' => user.name,
          'community_id' => user.community.id,
          'community_status' => 'accepted'
        }
      }
    end

    before do
      post '/auth/sign_in',
           params: { email: user.email, password: user.password },
           headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns expected response' do
      expect(response_json).to eq expected_response
    end
  end

  describe 'with invalid password' do
    before do
      post '/auth/sign_in',
           params: { email: user.email, password: 'wrongpassword' },
           headers: user_headers
    end

    it 'returns 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(response_json['errors']).to eq [
        'Invalid login credentials. Please try again.'
      ]
    end
  end

  describe 'with invalid email' do
    before do
      post '/auth/sign_in',
           params: { email: 'wrong@mail.com', password: user.password },
           headers: user_headers
    end

    it 'returns 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(response_json['errors']).to eq [
        'Invalid login credentials. Please try again.'
      ]
    end
  end
end
