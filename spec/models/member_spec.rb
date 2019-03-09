require 'rails_helper'

RSpec.describe Member, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:reviews) }

    it { should have_many(:attendances) }

    it { should have_many(:interests) }

    it { should have_many(:events) }

    end

    describe "InDirect Associations" do

    it { should have_many(:attending_events) }

    end

    describe "Validations" do
      
    end
end
