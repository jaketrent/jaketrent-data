Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Rails.application.secrets.twitter_provider_key, Rails.application.secrets.twitter_provider_secret
end

