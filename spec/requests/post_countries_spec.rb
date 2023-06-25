require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:my_country) { FactoryBot.create(:country) }

      before do
        post '/countries', params:
                          { country: {
                            name: my_country.name,
                            capital_city: my_country.capital_city
                          } }
      end

      it 'returns the name' do
        expect(json['name']).to eq(my_country.name)
      end

      it 'returns the capital_city' do
        expect(json['capital_city']).to eq(my_country.capital_city)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/countries', params:
                          { country: {
                            name: '',
                            capital_city: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end