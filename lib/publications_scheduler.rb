class PublicationsScheduler
  def run!
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
    @hour ||= Time.now.hour
  end
end
