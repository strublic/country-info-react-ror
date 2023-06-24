class CountriesController < ApplicationController
  before_action :set_country, only: %i[ show update destroy ]
  before_action :authorized

  # GET /countries
  def index
    @countries = Country.all.order(id: :desc)
    render json: @countries
  end

  def show
    render json: @country
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @country.destroy
  end


  def search
    country = "%#{params[:country]}%"

    if params[:country].present?
      @countries = Country.where("countries.name ILIKE ? OR countries.capital_city ILIKE ?", country, country).uniq
    else
      @countries = Country.all.uniq
    end

    render json: @countries
  end

  private
    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name, :area_total, :population_size, :capital_city, :desc, :density)
    end
end
