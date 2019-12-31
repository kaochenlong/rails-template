require 'fileutils'
require "tmpdir"

SOURCE_REPO = "https://github.com/kaochenlong/rails-template.git"

def yarn(package)
  run "yarn add #{package}"
end

def set_source_path
  if __FILE__ =~ %r{\Ahttps?://}
    tempdir = Dir.mktmpdir("rails-template-")
    source_paths.unshift(tempdir)
    at_exit { remove_dir(tempdir) }
    git clone: "--quiet #{SOURCE_REPO} #{tempdir}"
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

def copy_procfile
  copy_file 'Procfile.dev'
  copy_file '.foreman'
end

set_source_path

gem 'figaro', '~> 1.1', '>= 1.1.1'

gem_group :development, :test do
  gem 'foreman', '~> 0.86.0'
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.10'
  gem 'pry-rails', '~> 0.3.9'
end

after_bundle do
  application do <<-RUBY
    config.generators do |g|
      g.assets false
      g.helper false
    end
    RUBY
  end

  copy_procfile

  route "root 'pages#home'"

  run "spring stop"

  generate :controller, "pages"

  run "bundle exec figaro install"

  copy_file 'app/views/pages/home.html.erb'

  generate "rspec:install"
  remove_dir "test"

  # frontend packages
  yarn "tailwindcss"

  inject_into_file 'app/javascript/packs/application.js', after: "// const imagePath = (name) => images(name, true)" do 
    "\n\nimport 'scripts'\nimport 'styles'\n"
  end

  inject_into_file 'postcss.config.js', after: "require('postcss-import')," do 
    "\n    require('tailwindcss'),\n    require('autoprefixer'),"
  end

  copy_file 'app/javascript/scripts/index.js'
  copy_file 'app/javascript/scripts/application.js'
  copy_file 'app/javascript/styles/index.js'
  copy_file 'app/javascript/styles/application.scss'

  # images
  gsub_file "app/javascript/packs/application.js", "// const images", "const images"
  gsub_file "app/javascript/packs/application.js", "// const imagePath", "const imagePath"
  copy_file 'app/javascript/images/.keep'

  # move app/javascript to app/frontend
  gsub_file "config/webpacker.yml", /source_path\: app\/javascript/, "source_path: app\/frontend"
  run "mv app/javascript app/frontend"

  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"

  puts "Everything seems LGTM, Awesome!"
end

