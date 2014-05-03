class CleanupCloudinary
  @@public_ids = []

  def self.add_public_id(id)
    @@public_ids << id

    clean if @@public_ids.count >= 100
  end

  def self.clean
    Cloudinary::Api.delete_resources(@@public_ids) if @@public_ids.count > 0

    @@public_ids = []
  end
end
