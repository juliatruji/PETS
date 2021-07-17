source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.5'
gem 'jwt', '~> 2.1'
gem 'carrierwave', '~> 2.1'
gem 'rswag'
gem 'rswag-api', '~> 2.3', '>= 2.3.1'
gem 'rswag-ui', '~> 2.3', '>= 2.3.1'
gem 'pundit', '~> 2.0'
gem 'simple_command', '~> 0.0.9'
gem 'api-pagination', '~> 4.8', '>= 4.8.2'
gem 'sentry-raven', '~> 3.0'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'active_model_serializers', '~> 0.10.10'
gem 'rack-cors', :require => 'rack/cors'
gem 'rake'
gem 'rspec'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.5'
  gem 'rswag-specs', '~> 2.3', '>= 2.3.1'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rspec-rails', '~> 3.5'
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
