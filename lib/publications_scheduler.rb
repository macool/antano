class PublicationsScheduler
  def run!
    check_for_failed_publications!
    schedule_publish_new_photos!
  end

  def check_for_failed_publications!
    raise Photo::DidNotFinishPublishingError if Photo.exists?(status: Photo.statuses[:publishing])
  end

  def schedule_publish_new_photos!
    0.upto(2).each do |i|
      if photo = Photo.next_photo
        number_of_hours = hours[i] - hour
        if number_of_hours > 0
          # transform_to_seconds and randomize it a bit
          delay = (number_of_hours * 3600) + rand(3600)
          photo.publish_in delay
        else
          photo.publish_async!
        end
      end
    end
  end

  def hours
    @hours ||= [11, 13, 17]
  end

  def hour
    @hour ||= Time.zone.now.hour
  end
end
