module Management
  class PendingPhotosController < ManagementController
    expose_decorated(:photos) { Photo.sorted.ready }
  end
end
