RSpec.describe 'post /pings', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'user POST a ping' do
    before do
      post '/pings',
        params: {
          time: "2020-04-31-15:00",
          store: "ica"
        },
        headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end
    it 'returns success message' do
      expect(response_json['message']).to eq "Your trip is now active"
    end
  end
end