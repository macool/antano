# encoding: utf-8
class Photo < ActiveRecord::Base
  module Shareable
    extend ActiveSupport::Concern

    CUXIBAMBA_FB_PAGE_ID = 698505323546428
    LOJA_FB_PAGE_ID = 107623235927530

    class AlreadyPublishedError < StandardError; end
    class AlreadyTweetedError < AlreadyPublishedError; end
    class AlreadyPostedToFBError < AlreadyPublishedError; end

    def publish!
      shares.create! provider: "twitter", obj: publish_on_twitter
      shares.create! provider: "facebook", obj: publish_on_facebook
      update! status: :published
      self
    end

    def publish_async!
      PublishPhotoJob.new.async.perform(id)
    end

    def published_tweet
      shares.where(provider: "twitter").first.try(:obj)
    end

    def published_fb_post
      shares.where(provider: "facebook").first.try(:obj)
    end

    private

    def permalink
      "#{ENV["HOST_URL"]}/p/#{id}"
    end

    def publish_on_facebook
      raise AlreadyPostedToFBError if published_fb_post.present?
      options = {
        message: "#LoxaDeAntaño #{ENV["HOST_URL"]}",
        link: permalink,
        place: LOJA_FB_PAGE_ID
      }
      Antano.facebook_graph.put_connections(CUXIBAMBA_FB_PAGE_ID, "feed", options)
    end

    def publish_on_twitter
      raise AlreadyTweetedError if published_tweet.present?
      text = "#LoxaDeAntaño #{permalink}"
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
