# frozen_string_literal: true

RSpec.describe 'POST /pongs', type: :request do
  describe 'successfully' do
    let(:user) { create(:user, role: 'user')}
    let(:ping) { create(:ping, user: user) }
    let(:user) { create(:user, role: 'user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    
    describe 'can create pong' do
      before do
        post '/pongs',
             params:
             { pong:
              {
                item1: 'Bacon',
                item2: 'Butter',
                item3: 'Schampoo',
                ping_id: ping.id,
                user_id: user.id
              } },
             headers: user_headers
      end

      it 'returns response status 200' do
        expect(response.status).to eq 200
      end

      it 'returns success message' do
        expect(response_json['message']).to eq 'Your request was added to this trip'
      end
    end
  end
end
