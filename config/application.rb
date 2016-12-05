require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hefesto
  class Application < Rails::Application
    config.cas = config_for(:cas)
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = 'pt-BR'
    config.beginning_of_week = :sunday
  end
end
