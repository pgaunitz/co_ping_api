# frozen_string_literal: true

RSpec.describe 'post /pings', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'user POST a ping' do
    before do
      post '/pings',
           params: {
             ping: {
               time: '2020-04-31-15:00',
               store: 'ica'
             }
           },
           headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end
    it 'returns success message' do
      expect(response_json['message']).to eq 'Your new trip is now active'
    end
  end

  describe 'user POST a ping without store' do
    before do
      post '/pings',
           params: {
             ping: {
               time: '2020-04-31-15:00'
             }
           },
           headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end
    it 'returns success message' do
      expect(response_json['message']).to eq 'Your new trip is now active'
    end
  end

  describe 'user POST a ping without time' do
    before do
      post '/pings',
           params: {
             ping: {
               store: 'Ica'
             }
           },
           headers: headers
    end
    it 'returns a 422 response status' do
      expect(response).to have_http_status 422
    end
    it 'returns error message' do
      expect(response_json['message']).to eq 'You need to set a time for your new trip'
    end
  end
end
