FactoryGirl.define do
  factory :profile do
    name "user"
    age "1990"
    sequence(:phone) { |n| "0000000#{n}" } 
    bio "text text"
    gender true
    sequence(:username) { |n| "person#{n}" }
    association :user, factory: :user
  end

end
