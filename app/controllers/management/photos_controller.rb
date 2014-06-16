module Management
  class PhotosController < ManagementController
    expose(:photo_suggestion)  { PhotoSuggestion.new }
    expose(:photo_suggestions) { photo.photo_suggestions.includes(:user) }
    expose_decorated(:photos)  { Photo.sorted.ready }
    expose_decorated(:photo)   { photos.find(params[:id]) }

    private

    def set_breadcrumbs
      super
      self.current_breadcrumbs << ["Fotos pendientes", management_photos_path]
    end
  end
end
