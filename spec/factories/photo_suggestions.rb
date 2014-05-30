# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo_suggestion do
    user
    photo
  end
end
