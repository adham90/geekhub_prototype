require "rails_helper"

describe "user creation" do
  it "allows user to create account" do
    expect { create(:profile) }.to change { Profile.count }
    expect { create(:profile) }.to change { User.count }
  end
end