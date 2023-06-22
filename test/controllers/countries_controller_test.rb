require "test_helper"

class CountriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @country = countries(:one)
  end

  test "should get index" do
    get countries_url, as: :json
    assert_response :success
  end

  test "should create country" do
    assert_difference("Country.count") do
      post countries_url, params: { country: { area_total: @country.area_total, capital_city: @country.capital_city, name: @country.name, population_size: @country.population_size } }, as: :json
    end

    assert_response :created
  end

  test "should show country" do
    get country_url(@country), as: :json
    assert_response :success
  end

  test "should update country" do
    patch country_url(@country), params: { country: { area_total: @country.area_total, capital_city: @country.capital_city, name: @country.name, population_size: @country.population_size } }, as: :json
    assert_response :success
  end

  test "should destroy country" do
    assert_difference("Country.count", -1) do
      delete country_url(@country), as: :json
    end

    assert_response :no_content
  end
end
