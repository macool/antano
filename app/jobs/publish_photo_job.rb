class PublishPhotoJob
  include SuckerPunch::Job

  def perform(photo_id)
    ActiveRecord::Base.connection_pool.with_connection do
      Photo.find(photo_id).publish!
    end
  end
end
