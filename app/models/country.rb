class Country < ApplicationRecord
    attr_accessor :density

    validates :name, :capital_city, presence: true
    # validates :population_size, :area_total, presence: true 

    def density
        begin (population_size.to_f/area_total.to_f).round(2) rescue 0 end
    end
end
