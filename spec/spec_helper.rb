require 'bundler/setup'
require 'coveralls'
require 'shoulda/matchers'
require 'support/controller_helpers'
require 'support/database_cleaner'

# These two lines are required for breadcrumbs_on_rails, probably because
# something is wrong with the gem. As of the time of writing, there is an open
# issue for it here: https://github.com/weppos/breadcrumbs_on_rails/issues/108
require 'active_support/concern'
require 'rails'

ENV['RAILS_ENV'] ||= 'test'

Coveralls.wear!('rails')

::Bundler.require(:default, :test)
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include ControllerHelpers, type: :controller
end
