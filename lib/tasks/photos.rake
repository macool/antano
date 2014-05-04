namespace :photos do
  desc "publish next queued photo to twitter and facebook"
  task publish: :environment do
    Photo.next_photo.publish!
  end
end
