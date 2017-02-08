require 'bundler/setup'
require 'coveralls'
require 'shoulda/matchers'
require 'support/controller_helpers'

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
