require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  describe "DELETE /destroy" do
    let!(:country) { FactoryBot.create(:country) }

    before do
      delete "/countries/#{country.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end