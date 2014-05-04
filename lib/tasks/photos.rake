namespace :photos do
  desc "tweet a photo"
  task publish: :environment do
    Photo.next_photo.publish!
  end
end
