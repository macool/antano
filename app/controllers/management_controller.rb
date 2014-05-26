class ManagementController < ApplicationController
  before_action :require_login
  before_action :confirm_logged_in_is_manager

  layout "admin"

  protected

  def confirm_logged_in_is_manager
    if not current_user.admin? and not current_user.manager?
      redirect_to root_path
    end
  end
end
