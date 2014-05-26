# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:nombres) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }

    trait :manager do
      after(:build) do |user|
        profile = user.profile
        Manager.create!(provider: profile.provider,
                        nickname: profile.nickname)
      end
    end

    trait :with_profile do
      profile { build(:profile) }
    end
  end
end
