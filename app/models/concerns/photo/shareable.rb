# encoding: utf-8
class Photo < ActiveRecord::Base
  module Shareable
    extend ActiveSupport::Concern

    include ActionView::Helpers::TextHelper

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
      logger.info "[Photo::Shareable] publish async photo #{self}"
      PublishPhotoJob.new.async.perform(id)
      update! status: :publishing
    end

    def publish_in(seconds)
      logger.info "[Photo::Shareable] will publish photo in #{seconds} seconds #{self}"
      PublishPhotoJob.new.async.later(seconds, id)
      update! status: :publishing
    end

    def published_tweet
      shares.where(provider: "twitter").first.try(:obj)
    end

    def published_fb_post
      shares.where(provider: "facebook").first.try(:obj)
    end

    def permalink
      "#{ENV["HOST_URL"]}/p/#{id}"
    end

    private

    def publish_on_facebook
      raise AlreadyPostedToFBError if published_fb_post.present?
      options = {
        message: "#{title} #LoxaDeAntaño #{ENV["HOST_URL"]}",
        link: permalink,
        place: LOJA_FB_PAGE_ID
      }
      logger.info "[Photo::Shareable] attempt to post to facebook #{self}"
      Antano.facebook_graph.put_connections(CUXIBAMBA_FB_PAGE_ID, "feed", options)
    end

    def truncated_title
      truncate(title, length: 97)
    end

    def publish_on_twitter
      raise AlreadyTweetedError if published_tweet.present?
      text = "#{truncated_title} #LoxaDeAntaño #{permalink}"
      media = open image.send(:public).url
      options = {
        possibly_sensitive: false,
        lat: -3.996784,
        long: -79.201995
      }
      logger.info "[Photo::Shareable] attempt to post to twitter #{self}"
      Antano.twitter_client.update_with_media text, media, options
    end
  end
end
