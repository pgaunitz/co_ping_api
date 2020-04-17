RSpec.describe 'GET /admin/communities', type: :request do
  let(:community) { create(:community) }
  let!(:user) { create(:user, role: 'user', community_status: 'pending', community_id: community.id) }
  let!(:user2) { create(:user, role: 'user', community_status: 'pending', community_id: community.id) }
  let!(:user3) { create(:user, role: 'user', community_status: 'accepted', community_id: community.id) }
  let!(:user4) { create(:user, role: 'user', community_status: 'pending') }

  let(:admin) { create(:user, role: 'admin', community_id: community.id) }
  let(:admin_credentials) { admin.create_new_auth_token }
  let(:admin_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(admin_credentials)
  end

  describe 'admin can see list of pending requests' do 
    before do
      get "/admin/communities",
      headers: admin_headers
    end 

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns all pending users to a community' do
      expect(response_json['requests'].count).to eq 2
    end

    it 'returns correct community id' do
      expect(response_json['requests'].first['community_id']).to eq community.id
    end
  end 



end

