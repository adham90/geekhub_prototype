require 'rails_helper'

describe Profile do
  describe "vaidations" do
    it { should validates_presence_of :name }

    it { should validates_presence_of :age }
    it { should validates_numericality_of :age }
    
    it { should validates_presence_of :phone }
    it { should validates_uniqueness_of :phone }

    it { should validates_presence_of :username }
    it { should validates_uniqueness_of :username }
  end

  describe 'association' do
    it { should belongs_to :user }
  end
end
