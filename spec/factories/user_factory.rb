FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user do
    email 
    password "Password"
    password_confirmation "Password"
    trait :admin do
      admin true
    end
  end
end
