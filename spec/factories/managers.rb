# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :manager do
    provider %w(twitter facebook)
    nickname { SecureRandom.hex }
  end
end
