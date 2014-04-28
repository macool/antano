module Admin
  class PhotosController < AdminController
    expose(:photos) { Photo.sorted }
    expose(:photo, attributes: :photo_params)

    def create
      if photo.save
        redirect_to action: :index
      else
        render :new
      end
    end
    alias_method :update, :create

    def allow
      self.photo = Photo.find params[:id]
      photo.update allowed: true
    end

    private

    def photo_params
      params.require(:photo).permit(:image, :image_cache, :title, :description, :allowed, :position)
    end
  end
end
