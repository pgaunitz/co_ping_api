RSpec.describe 'GET /communities' do
  let!(:community) { create(:community, code: '2tUnJLGwPYJq') }

  describe 'successfully gets community code ' do
    before do
      get '/communities',
      params: {
        q: '2tUnJLGwPYJq'
      }
    end
    it 'retruns 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns correct community id' do
      expect(response_json['community_id']).to eq community.id
    end
  end
end