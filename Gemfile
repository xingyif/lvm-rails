source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'coveralls', require: false
gem 'devise', '~> 4.2'
gem 'faker', '~> 1.7'
gem 'jquery-rails', '~> 4.2'
gem 'jquery-ui-rails', '~> 6.0.1'
gem 'rails', '~> 5.0'
gem 'rainbow', '< 2.2.1'
gem 'rubocop', '~> 0.47', require: false
gem 'sass-rails', '~> 5.0'
gem 'seed-fu', '~> 2.3'
gem 'simple_form', '~> 3.4.0'
gem 'turbolinks', '~> 5.0'
gem 'uglifier', '~> 3.0'

group :test do
  gem 'capybara', '~> 2.12.1'
  gem 'database_cleaner', '~> 1.5.3'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'rails-controller-testing', '~>1.0.1'
  gem 'rspec-rails', '~> 3.5'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
end

group :development, :test do
  gem 'awesome_print', '~> 1.7'
  gem 'pry', '~> 0.10'
  gem 'sqlite3', '~> 1.3'
end

group :production do
  gem 'pg', '~> 0.19'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
