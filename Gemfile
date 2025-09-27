source 'https://rubygems.org'

gem 'rspec', '~> 3.13'
gem 'specinfra', '~> 2.90'
gem 'serverspec', '~> 2.42'

gem 'specinfra-backend-kubernetes',
  git: 'https://github.com/Sharpie/specinfra-backend-kubernetes'

group :playwright, optional: true do
  gem 'playwright-ruby-client', '1.54.0'
  gem 'websocket-driver', '0.8.0'
end

if File.exist? "#{__FILE__}.local"
  eval(File.read("#{__FILE__}.local"), binding)
end
