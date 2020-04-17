# frozen_string_literal: true

RSpec.describe 'GET /admin/communities', type: :request do
  describe 'successfully' do
    let(:community) { create(:community) }

    let!(:user) { create(:user, role: 'user', community_status: 'accepted', community_id: community.id) }
    let!(:user2) { create(:user, role: 'user', community_status: 'pending') }

    let(:admin) { create(:user, role: 'admin', community_id: community.id) }
    let(:admin_credentials) { admin.create_new_auth_token }
    let(:admin_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(admin_credentials)
    end

    describe 'admin can see list of pending requests' do
      let!(:user3) { create(:user, role: 'user', community_status: 'pending', community_id: community.id) }
      let!(:user4) { create(:user, role: 'user', community_status: 'pending', community_id: community.id) }

      before do
        get '/admin/communities',
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

    describe 'there are no pending requests' do
      before do
        get '/admin/communities',
            headers: admin_headers
      end

      it 'returns message about no pedning requests' do
        expect(response_json['message']).to eq 'You have no pending requests to your community'
      end
    end
  end

  describe 'only admin can change community status' do
    let(:community) { create(:community) }

    let(:user) { create(:user, role: 'user', community_status: 'pending') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    
    before do
      put "/admin/communities/#{community.id}",
          params: {
            user_admission: {
              community_id: community.id,
              community_status: 'rejected',
              user_id: user.id
            }
          },
          headers: user_headers
    end

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(response_json['message']).to eq 'You are not authorized to do this, ask your admin'
    end
  end
end
