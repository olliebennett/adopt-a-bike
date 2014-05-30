#!/usr/bin/env bash

# Update
apt-get update

# Git
apt-get install -y git

# Install rbenv (Ruby Environment)
# git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
# source ~/.bashrc

# Install correct version of Ruby
apt-get install -y ruby1.9.3

#update-alternatives --set ruby /usr/bin/ruby1.9.1

#gem install bundler

# Install Rails dependencies
# ... avoid 'make: command not found' error.
apt-get install -y build-essential
# ... avoid issues when running 'bundle install'
apt-get install -y libxslt-dev libxml2-dev libsqlite3-dev

# ... avoid issues with Error installing pg: ERROR: Failed to build gem native extension.
apt-get install -y libpq-dev

# Install Ruby on Rails!
gem install rails

# Install ExecJS (required to find JavaScript runtime)
gem install execjs

# NodeJS (JavaScript runtime)
apt-get install -y nodejs

# ImageMagick (required for identifying / validating image uploads)
apt-get install -y libmagickwand-dev imagemagick

# Move to the /vagrant (shared) directory.
cd /vagrant

# Use bundler to manage (Ruby) dependencies
bundle install

# Run any new db migrations
bundle exec rake db:migrate
