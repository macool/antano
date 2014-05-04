# encoding: utf-8
class Photo < ActiveRecord::Base
  module Shareable
    extend ActiveSupport::Concern

    class AlreadyPublishedError < StandardError; end
    class AlreadyTweetedError < AlreadyPublishedError; end
    class AlreadyPostedToFBError < AlreadyPublishedError; end

    def publish!
      shares.create! provider: "twitter", obj: publish_on_twitter
      update! status: :published
      self
    end

    def publish_async!
      PublishPhotoJob.new.async.perform(id)
    end

    def published_tweet
      shares.where(provider: "twitter").first.try(:obj)
    end

    private

    def publish_on_twitter
      raise AlreadyTweetedError if published_tweet.present?
      url = "#{ENV["HOST_URL"]}/p/#{id}"
      text = "#LoxaDeAntaño #{url}"
      media = open image.send(:public).url
      options = {
        possibly_sensitive: false,
        lat: -3.996784,
        long: -79.201995
      }
      Antano.twitter_client.update_with_media text, media, options
    end
  end
end
