require 'rails_helper'

describe Profile do

  describe "vaidations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:age) }

    it { should validate_uniqueness_of(:phone).scoped_to(:id) }
    it { should validate_uniqueness_of(:username).scoped_to(:id) }
    it { should validate_numericality_of(:age) }
  end

  describe 'association' do
    it { should belong_to(:user) }
  end
end
