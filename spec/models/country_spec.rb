require 'rails_helper'

RSpec.describe Country, :type => :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:capital_city) }
  it { should validate_presence_of(:population_size) }
  it { should validate_presence_of(:area_total) }
  it { should validate_presence_of(:desc) }


  subject { 
    described_class.new(FactoryBot.attributes_for(:country) )  
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an capital_city" do
      subject.capital_city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a population_size" do
      subject.population_size = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a area_total" do
      subject.area_total = nil
      expect(subject).to_not be_valid
    end
        
    it "is not valid without a desc" do
      subject.desc = nil
      expect(subject).to_not be_valid
    end
  end
end