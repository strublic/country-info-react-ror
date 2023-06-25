require 'rails_helper'

RSpec.describe 'Users', type: :request do
  def create_user(username, password)
    post users_path, params: {
        username: username,
        password: password
    }
  end

  def get_json
    JSON.parse(response.body).deep_symbolize_keys
  end

  describe 'POST /create' do

    context 'with valid parameters' do
      let!(:my_user) { FactoryBot.build(:user) }
      before do
        create_user(my_user.username, my_user.password)
      end
            
      it 'returns the username' do
        expect(get_json[:user][:username]).to eq(my_user.username)
      end

      it 'returns a token' do
        expect(decoder_token(get_json[:token])["user_id"]).to eq(get_json[:user][:id])
      end

      it '1 new user record created' do
        expect(User.count).to eq(1)        
      end

      it 'returns a success status' do
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      before do
        create_user("", "")
      end
      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a "Invalid username or password" error message' do
        expect(response.body).to match("Invalid username or password")
      end

      it '0 new user record created' do
        expect(User.count).to eq(0)
      end
    end
  end

  describe 'POST /login' do
    let!(:my_user) { FactoryBot.create(:user) }

    context 'with valid parameters' do
      before do
        post '/login', params:
          {
            username: my_user.username,
            password: my_user.password
          }
      end

      it 'login user' do
        expect(response).to have_http_status(:ok)
        expect(get_json[:user][:username]).to eq(my_user.username)
        expect(decoder_token(get_json[:token])["user_id"]).to eq(get_json[:user][:id])
      end

      it 'returns a token' do
        expect(decoder_token(get_json[:token])["user_id"]).to eq(get_json[:user][:id])
      end
    end

    context 'with invalid parameters' do
      before do
        post '/login', params:
          {
            username: "",
            password: ""
          }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a "Invalid username or password" error message' do
        expect(response.body).to match("Invalid username or password")
      end
    end
  end
end