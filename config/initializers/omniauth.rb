Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV.fetch('FIND_THE_FOUNDER_CONSUMER_KEY'), ENV.fetch('FIND_THE_FOUNDER_CONSUMER_SECRET')
end