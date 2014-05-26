class User < ActiveRecord::Base
  module Managementable
    def manager?
      Manager.exists?(provider: profile.provider,
                      nickname: profile.nickname)
    end
  end
end
