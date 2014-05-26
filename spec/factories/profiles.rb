# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    user
    uid { SecureRandom.hex }
    provider { %w(twitter facebook).sample }
    nickname { SecureRandom.hex(3) }
  end
end
