namespace :photos do
  desc "tweet a photo"
  task tweet: :environment do
    Photo.next_photo.tweet!
  end
end
