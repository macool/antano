class PhotosController < ApplicationController
  expose_decorated(:photos) { Photo.sorted.published }
  expose_decorated(:photo)

  expose(:og_url) { photo.send(:permalink) }
  expose(:og_title) { photo.title }
  expose(:og_image) { photo.image_url(:public) }

  def show
    self.photo = photos.find params[:id]
  end
end
