module Admin
  class UsersController < AdminController
    expose_decorated(:users) { User.all }
  end
end
