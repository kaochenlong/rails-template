require 'fileutils'

source_paths.unshift(File.dirname(__FILE__))

gem_group :development, :test do
  gem 'foreman', '~> 0.86.0'
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.7'
  gem 'pry-rails', '~> 0.3.9'
end

after_bundle do
  application do <<-RUBY
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
    end
    RUBY
  end

  copy_procfile

  route "root 'pages#home'"

  run "spring stop"

  generate(:controller, "pages")

  copy_file 'app/views/pages/home.html.erb'

  generate "rspec:install"
  remove_dir "test"

  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end

def copy_procfile
  copy_file 'Procfile.dev'
  copy_file '.foreman'
end
