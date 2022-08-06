#config/initializers/rack_attack.rb
# Throttle login attempts for a given email parameter to 6 reqs/minute
# Return the email as a discriminator on POST /login requests
Rack::Attack.throttle('limit logins per email', limit: 6, period: 60) do |req|
    if req.path == '/users/sign_up' && req.post?
      req.params['email']
    end
  end