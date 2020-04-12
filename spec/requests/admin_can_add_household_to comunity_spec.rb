RSpec.describe 'post /coop', type: :request do
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

  describe 'successfull' do
    before do
      post '/coop',
           params: {
             article: {
               email: 'user@mail.com',
               password: 'password',
               password_confirmation: 'password',
               coop_id: admin.coop_id
             }
           },
           headers: admin_headers
    end

    it 'returns status 200' do
      expect(response.status).to eq 200
    end

    it 'returns message that user has been created' do
      expect(response_json['message']).to eq 'User has been created'
    end
  end
end
