twitter_options = {
  image_size: "bigger",
  authorize_params: {
    lang: "es"
  }
}

facebook_options = {
  scope: "basic_info,email,publish_stream"
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"], twitter_options
  provider :facebook, ENV["FACEBOOK_KEY"], ENV["FACEBOOK_SECRET"], facebook_options
end
