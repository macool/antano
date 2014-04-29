class PhotoDecorator < ApplicationDecorator
  def edit_button
    h.link_to "", h.edit_admin_photo_path(self), class: "glyphicon glyphicon-edit btn btn-xs btn-link"
  end

  def share_button
    h.link_to("share", h.share_admin_photo_path(self), class: "btn btn-success", method: :post, remote: true, data: {confirm: "Send to twitter? You can not undo this"}) if ready?
  end

  def position
    h.content_tag :div, object.position, class: "float-right"
  end

  def admin_status
    edit_button + tweet_status + position
  end

  def tweet_status
    if pending? or ready?
      h.link_to status, h.allow_admin_photo_path(self), class: "label label-#{status_label}", method: :post, remote: true
    elsif published? or publishing?
      h.content_tag :span, status, class: "label label-primary"
    end
  end

  private

  def status_label
    if pending?
      "default"
    else
      "success"
    end
  end
end
