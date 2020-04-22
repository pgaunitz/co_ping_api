# frozen_string_literal: true

RSpec.describe 'Swishes', type: :request do
  let!(:user) { create(:user, role: 'user', community_status: 'pending') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  let!(:ping) { create(:ping) }
  let!(:pong) { create(:pong, user_id: user.id, total_cost: '54 kr') }

  before do
    post '/swish',
         params: {
           swish: {
             total_cost: pong.total_cost,
             pong_id: pong.id
           }
         },
         headers: user_headers
  end

  it 'returns a 200 response status' do
    expect(response).to have_http_status 200
  end

  it 'returns payment status' do
    expect(response_json['message']).to eq 'PAYMENT SUCCESSFUL'
  end
end
