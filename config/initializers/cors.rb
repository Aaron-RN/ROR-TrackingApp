# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allowed_methods = i%[get post put patch delete options head]
  allow do
    origins 'http://localhost:3000'
    resource '*', headers: :any, methods: allowed_methods, credentials: true
  end
  allow do
    origins 'https://arn-tracking-app.herokuapp.com'
    resource '*', headers: :any, methods: allowed_methods, credentials: true
  end
end
