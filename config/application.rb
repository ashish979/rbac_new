require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Erp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.default_url_options = { host: Rails.application.secrets.app_host }

    config.action_mailer.smtp_settings = {
        address: Rails.application.secrets.smtp_host,
        port: Rails.application.secrets.smtp_port,
        user_name: Rails.application.secrets.sender_email,
        password: Rails.application.secrets.sender_password
    }
  end
end
