RSpec.describe 'GET /communities', type: :request do
  let(:community) { create(:community) }
  let(:user) { create(:user, role: 'user', community_status: 'pending') }
  let(:user2) { create(:user, role: 'user', community_status: 'pending') }
  let(:user3) { create(:user, role: 'user', community_status: 'accepted') }
  let(:admin) { create(:user, role: 'admin') }
  let(:admin_credentials) { admin.create_new_auth_token }
  let(:admin_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(admin_credentials)
  end

  describe 'admin can see list of pending requests' do 
    before do
      get "/communities",
      headers: admin_headers
    end 

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns success message' do
      expect(response_json['requests'].count).to eq 2
    end

    # it 'admin can accept user admission' do
    #   expect(User.all.find(user.id).community_status).to eq 'accepted'
    # end
  end 



end

