source 'http://rubygems.org'

ruby "2.0.0", :engine => "jruby", :engine_version => "1.7.11"

gem 'rails', '3.2.13'
gem 'gravatar_image_tag', '1.0.0.pre2'
gem 'will_paginate', '~> 3.0'
gem 'json', '~> 1.8.1'
gem 'activerecord-jdbcsqlite3-adapter', '~> 1.3.6'

gem 'bootstrap-sass', '2.1'
gem 'bootstrap-will_paginate', '0.0.6'

gem 'sunspot_rails'
gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development

gem 'jquery-rails'
gem 'jquery-ui-rails'

group :development do
  gem 'annotate', '2.4.0'
  gem 'faker', '0.3.1'
end

group :test do
  gem 'webrat', '0.7.1'
  gem 'spork', '0.9.0.rc8'
  gem 'factory_girl_rails', '1.0'
  # gem 'autotest', '4.4.6'
  # gem 'autotest-rails-pure', '4.1.2'
  # gem 'autotest-fsevent', '0.2.4'
  # gem 'autotest-growl', '0.2.9'
end

group :development, :test do
  gem 'rspec-rails', '2.6.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
