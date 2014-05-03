# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    sequence(:title) { |n| "Photo #{n}" }
    image {
      # cloudinary sample image
      open "http://res.cloudinary.com/hgyyohfex/image/upload/v1398654581/sample.jpg"
    }
    description "MyString"
    position 0

    trait :published do
      status 3
    end

    # register cloudinary ids for post-test removal
    after(:create) do |photo|
      CleanupCloudinary.add_public_id(photo.image.file.public_id)
    end
  end
end
