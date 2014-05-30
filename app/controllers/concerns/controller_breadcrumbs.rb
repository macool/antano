module ControllerBreadcrumbs
  extend ActiveSupport::Concern

  included do
    expose(:current_breadcrumbs) { [] }

    before_action :set_breadcrumbs
  end

  def set_breadcrumbs; end
end
