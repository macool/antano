# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    user
    uid { SecureRandom.hex }
    provider { %w(twitter facebook).sample }
  end
end
