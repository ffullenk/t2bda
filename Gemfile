source 'https://rubygems.org'
gem 'rails', '3.2.13'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "mysql2", ">= 0.3.11"
gem "compass-rails", ">= 1.0.3", :group => :assets
gem "zurb-foundation", ">= 4.0.9", :group => :assets
gem "simple_form", ">= 2.1.0"
gem "quiet_assets", ">= 1.0.2", :group => :development
gem "figaro", ">= 0.6.3"
gem "better_errors", :group => :development
gem "binding_of_caller"
gem "libv8", ">= 3.11.8"
gem "therubyracer", ">= 0.11.3", :group => :assets, :platform => :ruby, :require => "v8"
gem "hub", ">= 1.10.2", :require => nil, :group => [:development]
gem 'yaml_db'

group :production do
	gem "pg"
	gem 'unicorn'
end
