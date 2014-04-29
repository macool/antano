# encoding: utf-8
class Photo < ActiveRecord::Base
  module Tweetable
    extend ActiveSupport::Concern

    def tweet!
      update! status: :publishing
      tweet = Antano.twitter_client.update tweet_text
      update! tweet: tweet, status: :published
    end

    private

    def tweet_text
      "#LoxaDeAntaño #{image_url(:twitter)} #{ENV["HOST_URL"]}"
    end
  end
end
