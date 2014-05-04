twitter_options = {
  image_size: "bigger",
  authorize_params: {
    lang: "es"
  }
}

facebook_options = {
  scope: "public_profile,user_friends,email,publish_stream,offline_access,manage_pages"
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"], twitter_options
  provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"], facebook_options
end
