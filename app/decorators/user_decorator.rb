class UserDecorator < ApplicationDecorator
  def avatar(options={})
    h.image_tag imagen_url, options
  end

  def small_avatar
    avatar class: "user-avatar mini"
  end
end
