# frozen_string_literal: true

RSpec.describe 'POST /pongs', type: :request do
  describe 'with valid credentials' do
    let(:user) { create(:user, role: 'user', community_status: 'accepted') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end

    describe 'can create pong' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: 'Bacon',
                 item2: 'Butter',
                 item3: 'Schampoo',
                 ping_id: ping.id,
                 user_id: user.id
               }
             },
             headers: user_headers
      end

      it 'returns response status 200' do
        expect(response).to have_http_status 200
      end

      it 'successfully creates pong' do
        expect(
          response_json['message']
        ).to eq "Now wait for your neighbour's reply"
      end

      it 'pong belongs to ping' do
        expect(Pong.last.ping_id).to eq ping.id
      end
    end

    describe 'can create pong with one item' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: 'Bacon',
                 item2: '',
                 item3: '',
                 ping_id: ping.id,
                 user_id: user.id
               }
             },
             headers: user_headers
      end

      it 'returns response status 200' do
        expect(response).to have_http_status 200
      end

      it 'successfully creates pong' do
        expect(
          response_json['message']
        ).to eq "Now wait for your neighbour's reply"
      end

      it 'pong belongs to ping' do
        expect(Pong.last.ping_id).to eq ping.id
      end
    end

    describe 'cannot create pong to inactive ping' do
      let(:ping) { create(:ping, active: false) }
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: 'Bacon',
                 item2: '',
                 item3: '',
                 ping_id: ping.id,
                 user_id: user.id
               }
             },
             headers: user_headers
      end

      it 'cannot create pong to inactive ping' do
        expect(response_json['message']).to eq 'This trip is no longer active'
      end
    end

    describe 'cannot create pong without items' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: '',
                 item2: '',
                 item3: '',
                 ping_id: ping.id,
                 user_id: user.id
               }
             },
             headers: user_headers
      end

      it 'cannot create pong without items' do
        expect(
          response_json['message']
        ).to eq 'You have to specify what items you need'
      end
    end

    describe 'cannot create pong without ping id' do
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: 'Bacon',
                 item2: '',
                 item3: '',
                 user_id: user.id
               }
             },
             headers: user_headers
      end

      it 'cannot create pong without ping id' do
        expect(
          response_json['message']
        ).to eq 'Something went wrong, better luck next time!'
      end
    end

    describe 'cannot create pong without user id' do
      let(:ping) { create(:ping) }
      before do
        post '/pongs',
             params: {
               pong: {
                 item1: 'Bacon',
                 item2: '',
                 item3: '',
                 ping_id: ping.id,
               }
             },
             headers: user_headers
      end

      it 'cannot create pong without user id' do
        expect(
          response_json['message']
        ).to eq 'Something went wrong, better luck next time!'
      end
    end
  end

  describe 'can only have one active pong' do
    let(:user) { create(:user, role: 'user') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    let!(:pong) { create(:pong, user: user) }
    let(:ping) { create(:ping) }
    before do
      post '/pongs',
           params: {
             pong: {
               item1: 'Bacon',
               item2: '',
               item3: '',
               ping_id: ping.id,
               user_id: user.id
             }
           },
           headers: user_headers
    end

    it 'cannot create several pongs' do
      expect(
        response_json['message']
      ).to eq 'You can only have one active request'
    end
  end

  describe 'can only have one active pong' do
    let(:user) { create(:user, role: 'user', community_status: 'pending') }
    let(:user_credentials) { user.create_new_auth_token }
    let(:user_headers) do
      { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
    end
    let(:ping) { create(:ping) }
    before do
      post '/pongs',
           params: {
             pong: {
               item1: 'Bacon',
               item2: '',
               item3: '',
               ping_id: ping.id,
               user_id: user.id
             }
           },
           headers: user_headers
    end

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns error message' do
      expect(
        response_json['message']
      ).to eq 'You are not part of a community yet, ask your admin for more information'
    end
  end

  describe 'without valid credentials' do
    let(:ping) { create(:ping) }
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }
    before do
      post '/pongs',
           params: {
             pong: {
               item1: 'Bacon',
               item2: 'Butter',
               item3: 'Schampoo',
               ping_id: ping.id
             }
           },
           headers: headers
    end

    it 'returns a 401 response status' do
      expect(response).to have_http_status 401
    end

    it 'returns success message' do
      expect(
        response_json['errors'].first
      ).to eq 'You need to sign in or sign up before continuing.'
    end
  end
end
