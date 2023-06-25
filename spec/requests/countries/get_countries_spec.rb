require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  let!(:user) { create(:user) }
  let!(:countries) { create_list(:country, 10) }

  describe 'GET /countries' do
    context 'with valid parameters' do
      it 'request with user token' do
        get '/countries', headers: { "Authorization" => "Bearer #{generate_token(user)}" }
        
        expect(response).to have_http_status(200)
        expect(Country.count).to eq(10)
      end
    end

    context 'with invalid parameters' do
      it 'request without user token' do
        get '/countries'

        expect(response).to have_http_status(401)
        expect(response.body).to match(/Please log in/)
      end
    end
  end
end