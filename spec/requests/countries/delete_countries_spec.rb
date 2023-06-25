require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  describe "DELETE /destroy" do
    let!(:user) { create(:user) }
    let!(:my_country) { FactoryBot.create(:country) }

    before do
      delete "/countries/#{my_country.id}"
    end

    it 'with token got success' do
      delete "/countries/#{my_country.id}",
      headers: { "Authorization" => "Bearer #{generate_token(user)}" }
      
      expect(response).to have_http_status(:success)
      expect(Country.count).to eq(0)
    end

    it 'without token got unauthorized' do
      delete "/countries/#{my_country.id}",
      headers: { "Authorization" => "Bearer #{""}" }

      expect(response).to have_http_status(:unauthorized)
      expect(Country.count).to eq(1)
    end

    it 'fake ID got not_found' do
      delete "/countries/0",
      headers: { "Authorization" => "Bearer #{generate_token(user)}" }

      expect(response).to have_http_status(:not_found)
      expect(response.body).to match(/Couldn't find Country with/)
      expect(Country.count).to eq(1)
    end
  end
end