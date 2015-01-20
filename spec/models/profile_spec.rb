require 'rails_helper'

describe Profile do

  describe "vaidations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:age) }

    # it { should validate_uniqueness_of(:phone) }
    # it { should validate_uniqueness_of(:username) }
    it { should validate_numericality_of(:age) }
    it { should accept_nested_attributes_for(:user) }
  end

  describe 'association' do
    it { should belong_to(:user) }
    it { should have_and_belong_to_many(:skills) }
  end
end
