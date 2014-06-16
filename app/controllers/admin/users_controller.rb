module Admin
  class UsersController < AdminController
    expose_decorated(:users) { User.all }

    private

    def set_breadcrumbs
      super
      self.current_breadcrumbs << ["Usuarios", admin_users_path]
    end
  end
end
