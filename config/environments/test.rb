Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  # Not needed, remove for now
  # Capybara.current_driver = :chrome

  config.cache_classes = true

  config.eager_load = false

  config.serve_static_files   = true
  config.static_cache_control = 'public, max-age=3600'

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false

  config.action_mailer.delivery_method = :test

  config.active_support.test_order = :random

  config.active_support.deprecation = :stderr
end
