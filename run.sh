#!/bin/bash

# Ensure bundler gem is installed
gem install bundler

# Update ruby gem bundle
bundle

# Run application
bundle exec shotgun -p 9292 -o '0.0.0.0'