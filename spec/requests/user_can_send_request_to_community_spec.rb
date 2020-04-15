RSpec.describe 'GET /communities' do
  let!(:community) { create(:community, code: '2tUnJLGwPYJq') }
  let!(:community2) { create(:community, code: 'paYljxCDcjGE') }
  let!(:community3) { create(:community, code: 'Hqxx5Uk5evmD') }
  
  describe 'successfully sends community code ' do
    before do
      get '/communities',
      params: {
        q: 'paYljxCDcjGE'
      }
    end
    it 'retruns 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns correct community id' do
      expect(response_json['community_id']).to eq Community.second.id
    end
  end
  describe 'unsuccessfully sends community code' do
    before do
      get '/communities',
      params: {
        q: '123456789102'
      }
    end
    it 'retruns 422 response' do
      expect(response.status).to eq 422
    end

    it 'returns correct community id' do
      expect(response_json['message']).to eq 'There is unfortunately no community with this code, did you type it correctly?'
    end
  end
end