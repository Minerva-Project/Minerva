require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rails'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
  RSpec.configure do |config|
    
    config.include Devise::TestHelpers, :type => :controller
    
    config.color_enabled = true
    config.mock_with :rspec
    
    config.include Mongoid::Matchers
    config.include Devise::TestHelpers, :type => :controller
    
    require 'database_cleaner'
    
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.orm = "mongoid"
    end
    
    Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
      load model
    end

    config.before(:each) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
end