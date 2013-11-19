# encoding: utf-8

require 'rake'
require 'sinatra'
require 'slim'
require 'compass'
require 'sass'

configure do
  set :environment, :development

  set :root, File.dirname(__FILE__)
  set :views, 'views'
  set :public_folder, 'public'
  set :styles, 'styles'
  set :scripts, 'scripts'

  Slim::Engine.set_default_options pretty: (settings.environment == :development ? true : false), sort_attrs: true
  set :sass, Compass.sass_engine_options
end

require './functions'
require './router'

run Sinatra::Application