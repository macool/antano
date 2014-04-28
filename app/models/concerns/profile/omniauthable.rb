class Profile < ActiveRecord::Base
  module Omniauthable
    extend ActiveSupport::Concern

    def info=(hash)
      [:nickname, :email, :description, :name, :image, :urls, :location].each do |field|
        send "#{field}=", hash[field]
      end
    end

    def credentials=(hash)
      self.token_access = hash["token"]
      self.token_secret = hash["secret"]
    end

    def extra=(hash)
      self.raw_info = hash[:raw_info]
    end

    module ClassMethods
      def create_or_update_from_omniauth(hash)
        where(uid: hash[:uid], provider: hash[:provider]).first_or_initialize.tap do |profile|
          hash.each do |key, value|
            profile.send "#{key}=", value
          end
          profile.user = User.create_or_update_from_profile profile
          profile.save!
        end
      end
    end
  end
end
