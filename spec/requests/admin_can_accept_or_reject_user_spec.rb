# frozen_string_literal: true

RSpec.describe 'PUT /communities', type: :request do
  let(:community) { create(:community) }
  
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

  describe 'admin can accept user to community' do
    before do
      put "/admin/communities/#{community.id}",
          params: {
            user_admission: {
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
      expect(response_json['message']).to eq 'User is now accepted to your community'
    end

    it 'admin can accept user admission' do
      expect(User.all.find(user.id).community_status).to eq 'accepted'
    end
  end

  describe 'admin can reject user to community' do
    before do
      put "/admin/communities/#{community.id}",
          params: {
            user_admission: {
              community_id: community.id,
              community_status: 'rejected',
              user_id: user.id
            }
          },
          headers: admin_headers
    end

    it 'returns success message' do
      expect(response_json['message']).to eq 'User is now rejected from your community'
    end

    it 'admin can reject user admission' do
      expect(User.all.find(user.id).community_status).to eq 'rejected'
    end
  end

  describe 'only admin can change community status' do
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
