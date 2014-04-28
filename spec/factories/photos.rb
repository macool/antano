# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    sequence(:title) { |n| "Photo #{n}" }
    description "MyString"
    position 0
  end
end
