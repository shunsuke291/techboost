class Application < Rails::Application
  config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
end