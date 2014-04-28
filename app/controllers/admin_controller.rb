class AdminController < ApplicationController
  before_action :require_login
  before_action :confirm_logged_in_is_admin

  def index
  end

  protected

  def confirm_logged_in_is_admin
    redirect_to root_path unless current_user.admin?
  end
end
