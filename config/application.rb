require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module LeCollectionist
  class Application < Rails::Application
    config.load_defaults 6.1

    config.i18n.default_locale = :fr
    config.i18n.available_locales = [:fr, :en]
  end
end
