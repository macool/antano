class ManagementController < ApplicationController
  include ControllerBreadcrumbs

  before_action :require_login
  # allow everyone to post as long as he is authenticated
  # before_action :confirm_logged_in_is_manager

  layout "admin"

  protected

  def confirm_logged_in_is_manager
    if not current_user.admin? and not current_user.manager?
      redirect_to root_path
    end
  end
end
