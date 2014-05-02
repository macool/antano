class Profile < ActiveRecord::Base
  module Fetchable
    extend ActiveSupport::Concern

    module ClassMethods
      def fetch(options)
        find_by(options) || create_by(options)
      end

      def create_by(options)
        raise ArgumentError, "only twitter is supported" if options[:provider] != "twitter"
        case options[:provider]
        when "twitter"
          attrs = Antano.twitter_client.user(options[:uid] || options[:nickname]).attrs
          new(uid: attrs[:id_str],
                  provider: "twitter",
                  name: attrs[:name],
                  nickname: attrs[:screen_name],
                  image: attrs[:profile_image_url],
                  location: attrs[:location],
                  description: attrs[:description],
                  raw_info: attrs).tap do |profile|
            profile.user = User.create_or_update_from_profile(profile)
            profile.save!
          end
        end
      end
    end
  end
end
