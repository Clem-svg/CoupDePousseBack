# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'
    resource '*',
             #   resource "api/v1/*",
             headers: :any, methods: %i[get post put patch delete options head], credentials: true
  end

  allow do
    origins "https://coup-de-pousse-deploy-mb1leuckk-clem-svg.vercel.app/"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end
