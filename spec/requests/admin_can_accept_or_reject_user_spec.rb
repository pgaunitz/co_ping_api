RSpec.describe 'PUT /communities', type: :request do
  let(:user) { create(:user, role: 'user', community_status: 'pending') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    let(:admin) { create(:user, role: 'admin') }
    let(:admin_credentials) { admin.create_new_auth_token }
    let(:admin_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(admin_credentials)
    end
    describe 'admin can accept or reject user to community' do
      let(:community) { create(:community) } 
      before do
        put "/communities/#{community.id}",
             params: {
               user: {
                 community_id: community.id,
                 community_status: 'accepted',
                 user_id: user.id
               }
             },
             headers: admin_headers
      end

      it 'returns a 200 response status' do
        expect(response).to have_http_status 200
      end
      
      it 'returns success message' do
        expect(response_json['message']).to eq 'User is now accepted to your community.'
      end
    end
end