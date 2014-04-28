class Photo < ActiveRecord::Base
  module Tweetable
    extend ActiveSupport::Concern

    def tweet!

    end
  end
end
