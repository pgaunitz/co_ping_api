# frozen_string_literal: true

RSpec.describe 'PUT /profiles/id' do
  let!(:user) { create(:user, role: 'user', community_status: 'pending') }
  let(:user_credentials) { user.create_new_auth_token }
  let(:user_headers) do
    { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials)
  end
  describe 'Can update profile page' do
    before do
      put "/profiles/#{user.id}",
          params: {
            profile: {
              about_me: 'I do not love bacon anymore',
              phone_number: '070777333999'
            }
          },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns updated profile' do
      expect(response_json['user']['about_me']).to eq 'I do not love bacon anymore'
    end

    it 'returns updated profile' do
      expect(response_json['user']['phone_number']).to eq '070777333999'
    end

    it 'Updates phone number' do
      expect(User.find(user.id).phone_number).to eq '070777333999'
    end

    it 'Updates about me' do
      expect(User.find(user.id).about_me).to eq 'I do not love bacon anymore'
    end
  end

  describe 'Can update profile page with one attribute' do
    before do
      put "/profiles/#{user.id}",
          params: {
            profile: {
              about_me: 'I do not love bacon anymore'
            }
          },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns updated profile' do
      expect(response_json['user']['about_me']).to eq 'I do not love bacon anymore'
    end

    it 'Updates about me' do
      expect(User.find(user.id).about_me).to eq 'I do not love bacon anymore'
    end
  end

  describe 'Can update profile page with one attribute' do
    before do
      put "/profiles/#{user.id}",
          params: {
            profile: {
              about_me: 'I do not love bacon anymore',
              phone_number: '070777333999',
              name: 'Betty Idontlovebaconsson',
              adress: 'Fuckbaconstreet 2'
            }
          },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns updated profile' do
      expect(response_json['user']['about_me']).to eq 'I do not love bacon anymore'
    end

    it 'Updates about me' do
      expect(User.find(user.id).about_me).to eq 'I do not love bacon anymore'
    end

    it 'returns updated profile' do
      expect(response_json['user']['phone_number']).to eq '070777333999'
    end

    it 'Updates phone number' do
      expect(User.find(user.id).phone_number).to eq '070777333999'
    end

    it 'returns updated profile' do
      expect(response_json['user']['name']).to eq 'Betty Idontlovebaconsson'
    end

    it 'Updates name' do
      expect(User.find(user.id).name).to eq 'Betty Idontlovebaconsson'
    end

    it 'returns updated profile' do
      expect(response_json['user']['adress']).to eq 'Fuckbaconstreet 2'
    end

    it 'Updates adress' do
      expect(User.find(user.id).adress).to eq 'Fuckbaconstreet 2'
    end
  end

  describe 'Can update profile page with one attribute' do
    before do
      put "/profiles/#{user.id}",
          params: {
            profile: {
              phone_number: '',
              adress: 'Fuckbaconstreet 2'
            }
          },
          headers: user_headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns updated profile' do
      expect(response_json['message']).to eq 'You can not update you profile with an empty field'
    end

    it 'Updates adress' do
      expect(User.find(user.id).adress).to eq 'Baconstreet 37, floor 2'
    end
  end
end
