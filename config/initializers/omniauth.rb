Rails.application.config.middleware.use OmniAuth::Builder do
    # provider :stackexchange, 'client_id', 'client_secret', public_key: 'key', site: 'stackoverflow'
    provider :stackexchange, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], public_key: ENV['KEY'], site: 'stackoverflow', callback_url: 'http://localhost:3000/auth/stackexchange/callback'
end