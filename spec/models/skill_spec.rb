require 'rails_helper'

RSpec.describe Skill, :type => :model do
  describe 'association' do
    it { should have_and_belong_to_many(:profiles) }
  end
end
