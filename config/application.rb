require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RailsTutorial
  class Application < Rails::Application
    config.load_defaults 5.2
    config.i18n.default_locale = :en
    config.i18n.available_locales = %w(en vi)
    config.middleware.use I18n::JS::Middleware
  end
end
