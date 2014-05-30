module Management
  class PendingPhotosController < ManagementController
    expose_decorated(:photos) { Photo.sorted.ready }
    private

    def set_breadcrumbs
      super
      self.current_breadcrumbs << ["Fotos pendientes", management_pending_photos_path]
    end
  end
end
