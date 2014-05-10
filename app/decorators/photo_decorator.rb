# encoding: utf-8
class PhotoDecorator < ApplicationDecorator
  def edit_button
    h.link_to "", h.edit_admin_photo_path(self), class: "glyphicon glyphicon-edit btn btn-xs btn-link"
  end

  def published_at
    "Publicada el " + I18n.l(Time.parse(tweet.attrs[:created_at]).to_date, format: :long) if tweet
  end

  def share_button
    h.link_to("publish", h.publish_admin_photo_path(self), class: "btn btn-success", method: :post, data: {confirm: "Sure you want to publish this pic? You can not undo this"}) if ready?
  end

  def position
    h.content_tag :div, object.position, class: "float-right"
  end

  def admin_status
    edit_button + tweet_status + position
  end

  def description_str
    if description.blank?
      "No tenemos información acerca de esta imagen. ¿Sabes algo? " + h.link_to("Háznoslo saber", h.about_path(anchor: "contacto"))
    else
      GitHub::Markdown.render description
    end.html_safe
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
