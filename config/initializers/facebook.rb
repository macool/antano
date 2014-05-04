require "antano"

Antano.facebook_graph = Koala::Facebook::API.new(ENV["FACEBOOK_ADMIN_TOKEN"])
