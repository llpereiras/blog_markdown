source 'https://rubygems.org'

ruby '2.3.3'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

# Devido a imcompatibilidades, apontar para a branch rails-5.1
# Issue: https://github.com/plataformatec/devise/issues/4511
gem 'devise', git: 'https://github.com/gogovan/devise.git', branch: 'rails-5.1'

gem 'sidekiq'

gem 'twitter-bootstrap-rails', :git => 'https://github.com/seyhunak/twitter-bootstrap-rails.git'

gem 'redcarpet', '~> 3.4.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
