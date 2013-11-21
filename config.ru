# encoding: utf-8

require 'rake'
require 'sinatra'
require 'slim'
require 'compass'
require 'sass'
require 'mail'

configure do
  set :environment, :production

  set :root, File.dirname(__FILE__)
  set :views, 'views'
  set :public_folder, 'public'
  set :styles, 'styles'
  set :scripts, 'scripts'

  Mail.defaults do
      delivery_method :smtp,
                   {  :address              => 'smtp.mail.ru',
                      :port                 => 465,
                      :domain               => 'mgstrl.herokuapp.com',
                      :user_name            => 'mgstrl@mail.ru',
                      :password             => 'pazzword',
                      :authentication       => 'plain',
                      :enable_starttls_auto => true  
                    }
  end

  Slim::Engine.set_default_options pretty: (settings.environment == :development ? true : false), sort_attrs: true
  set :sass, Compass.sass_engine_options
  set :sass, :style => (settings.environment == :development ? :compact : :compressed)
end

require './functions'
require './router'

run Sinatra::Application