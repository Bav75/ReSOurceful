Rails.application.config.middleware.use OmniAuth::Builder do
    provider :stackexchange, ENV['CLIENT_ID'], ENV['CLIENT_SECRET'], public_key: ENV['KEY'], site: 'stackoverflow', callback_url: 'http://localhost:3000/auth/stackexchange/callback'
end