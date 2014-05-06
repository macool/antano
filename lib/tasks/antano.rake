require "publications_scheduler"

namespace :antano do
  desc "Daily task"
  task daily: :environment do
    case Date.today.wday
    when 3 # wednesday
      # raise an exception if there are no photos ready to publish. Ideally we would
      # notify a couple of people so that they can login and get ready some photos
      raise Photo::NoMorePhotosAvailableError unless Photo.next_photo
    when 5 # friday
      # schedule publications for today
      PublicationsScheduler.new.run!
    end
  end
end
