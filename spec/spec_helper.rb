require File.expand_path("../../config/environment", __FILE__)
require 'simplecov'
require 'rack/test'
require 'capybara'
require 'database_cleaner'
require 'rspec/rails'
require 'rspec/autorun'
ENV["RAILS_ENV"] ||= 'test'

# this loads all the files in the support directory
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL

  config.mock_with :rspec

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

