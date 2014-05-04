namespace :photos do
  desc "publish next queued photo to twitter and facebook"
  task publish: :environment do
    photo = Photo.next_photo
    raise Photo::NoMorePhotosAvailableError unless photo
    photo.publish!
  end
end
