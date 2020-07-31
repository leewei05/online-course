require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module OnlineCourse
  class Application < Rails::Application
    config.load_defaults 5.0
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
