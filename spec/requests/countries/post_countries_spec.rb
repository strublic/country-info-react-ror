require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  def get_json
    JSON.parse(response.body).deep_symbolize_keys
  end

  def calc_density(country)
    (country.population_size.to_f/country.area_total.to_f).round(2)
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:user) { create(:user) }
      let!(:my_country) { FactoryBot.build(:country) }

      before do
        post '/countries', params:
        { 
          country: {
            name: my_country.name,
            capital_city: my_country.capital_city,
            population_size: my_country.population_size,
            area_total: my_country.area_total,
            desc: my_country.desc
          } 
        },
        headers: { "Authorization" => "Bearer #{generate_token(user)}" }
      end

      it 'returns all params' do
        expect(get_json[:name]).to eq(my_country.name)
        expect(get_json[:capital_city]).to eq(my_country.capital_city)
        expect(get_json[:population_size]).to eq(my_country.population_size)
        expect(get_json[:area_total]).to eq(my_country.area_total)
        expect(get_json[:desc]).to eq(my_country.desc)
      end

      it 'returns demographic density calc' do
        expect(get_json[:density]).to eq(calc_density(my_country))
      end

      it 'returns created status' do
        expect(response).to have_http_status(:created)
      end

      it '1 new country record created' do
        expect(Country.count).to eq(1)
      end
    end

    context 'with invalid parameters' do
      let!(:user) { create(:user) }
      let(:valid_attributes) { FactoryBot.attributes_for(:country) }
      let(:invalid_attributes) { {:name => nil, :capital_city => nil, :population_size => nil, :area_total => nil, :desc => nil} }
            
      it 'invalid attributes with token got unprocessable_entity' do
        post '/countries', params:{ 
          country: invalid_attributes 
        },
        headers: { "Authorization" => "Bearer #{generate_token(user)}" }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(Country.count).to eq(0)
      end

      it 'valid attributes without token got unauthorized' do
        post '/countries', params:{ 
          country: valid_attributes 
        },
        headers: { "Authorization" => "Bearer #{""}" }
        
        expect(response).to have_http_status(:unauthorized)
        expect(Country.count).to eq(0)
      end
    end
  end
end