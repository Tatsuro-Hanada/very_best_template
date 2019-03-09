require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:genre) }

    it { should have_many(:reviews) }

    it { should have_many(:attendances) }

    it { should have_many(:interests) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    it { should have_many(:participants) }

    end

    describe "Validations" do
      
    end
end
