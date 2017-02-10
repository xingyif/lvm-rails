# This file is copied to spec/ when you run 'rails generate rspec:install'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end
require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'support/factory_girl'

ActiveRecord::Base.establish_connection
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
  config.filter_rails_from_backtrace!
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
end
