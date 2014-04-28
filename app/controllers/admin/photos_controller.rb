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

    def update
      if photo.update(photo_params)
        redirect_to action: :index
      else
        render :edit
      end
    end

    private

    def photo_params
      params.require(:photo).permit(:image, :image_cache, :title, :description, :allowed, :position)
    end
  end
end
