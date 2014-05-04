module Admin
  class PhotosController < AdminController
    expose(:next_photo) { Photo.next_photo }
    expose_decorated(:photos) { Photo.sorted }
    expose_decorated(:photo, attributes: :photo_params)

    before_filter :find_photo, only: [:allow, :publish]

    def create
      if photo.save
        redirect_to action: :show, id: photo.id
      else
        render :new
      end
    end
    alias_method :update, :create

    def allow
      photo.update status: photo.pending? ? :ready : :pending
    end

    def publish
      photo.publish!
      redirect_to action: :show, id: params[:id]
    end

    private

    def photo_params
      params.require(:photo).permit(:image, :image_cache, :title, :description, :allowed, :position)
    end

    def find_photo
      self.photo = Photo.find params[:id]
    end
  end
end
