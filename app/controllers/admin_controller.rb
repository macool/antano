class AdminController < ApplicationController
  include ControllerBreadcrumbs

  before_action :require_login
  before_action :confirm_logged_in_is_admin

  layout "admin"

  def index
  end

  protected

  def confirm_logged_in_is_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_breadcrumbs
    self.current_breadcrumbs << ["Administración", admin_path]
  end
end
