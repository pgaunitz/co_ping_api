RSpec.describe 'GET /communities' do
  let(:community) { create(:community, code: '2tUnJLGwPYJq') }

  describe 'successfully gets community code ' do
    before do
      get '/communites/',
      params
    end
  end
end