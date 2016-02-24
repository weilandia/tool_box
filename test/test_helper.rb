ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  fixtures :all
end

class FeatureTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
end
