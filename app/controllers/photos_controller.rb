class PhotosController < ApplicationController
  expose_decorated(:photos) { Photo.published }
  expose_decorated(:photo)
  
  def show
    self.photo = photos.find params[:id]
  end
end
