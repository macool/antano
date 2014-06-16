class UserDecorator < ApplicationDecorator
  def avatar(options={})
    h.image_tag imagen_url, options
  end

  def tiny_avatar
    avatar class: "user-avatar tiny"
  end

  def small_avatar
    avatar class: "user-avatar small"
  end
end
