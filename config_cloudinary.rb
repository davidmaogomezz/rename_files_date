# frozen_string_literal: true

# Configuration values for your account are available
# in Cloudinary's Management Console (https://cloudinary.com/console)
require 'byebug'
require 'dotenv'
Dotenv.load
require 'cloudinary'

Cloudinary.config do |config|
  byebug
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key = ENV['API_KEY']
  config.api_secret = ENV['API_SECRET']
end
