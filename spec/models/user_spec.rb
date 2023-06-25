require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }

  subject { 
      described_class.new(FactoryBot.attributes_for(:user) )  
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without an username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end