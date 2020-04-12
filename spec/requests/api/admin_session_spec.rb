RSpec.describe 'POST /api/auth/sign_in', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:user)  { create(:user, role: 'admin') } 
  let(:expected_response) do
    {
      'data' => {
        'id' => user.id,
        'uid' => user.email,
        'email' => user.email,
        'provider' => 'email',
        'allow_password_change' => true,
        'role' => 'admin',
        'name' => user.name
      }
    }
  end
  describe 'with valid credentials' do
    before do
      post '/api/auth/sign_in',
           params: { email: user.email, password: user.password },
           headers: headers
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
      post '/api/auth/sign_in',
           params: { email: user.email, password: 'wrongpassword' },
           headers: headers
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
      post '/api/auth/sign_in',
           params: { email: 'wrong@mail.com', password: user.password },
           headers: headers
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