class Country < ApplicationRecord
  attr_accessor :density

  validates :name, length: 1..20, presence: true 
  validates :capital_city, length: 1..20, presence: true 
  validates :desc, length: 1..140, presence: true 
  validates :population_size, length: 1..10, presence: true 
  validates :area_total, length: 1..8, presence: true 

  def density
    begin (population_size.to_f/area_total.to_f).round(2) rescue 0 end
  end
end
