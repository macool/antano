# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:nombres) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
  end
end
