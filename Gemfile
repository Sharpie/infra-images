source 'https://rubygems.org'

gem 'rspec', '~> 3.13'
gem 'specinfra', '~> 2.90'
gem 'serverspec', '~> 2.42'

if File.exist? "#{__FILE__}.local"
  eval(File.read("#{__FILE__}.local"), binding)
end