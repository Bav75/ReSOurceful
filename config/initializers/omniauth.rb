Rails.application.config.middleware.use OmniAuth::Builder do
    provider :stackexchange, 'client_id', 'client_secret', public_key: 'key', site: 'stackoverflow'
end