require 'sinatra/base'
require './models/link'
require_relative 'data_mapper_setup'

ENV['RACK_ENV']||='development'

class Bookmark_Manager < Sinatra::Base
  get '/' do
    @links =Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post '/' do
    Link.create(url: params[:url], title: params[:title])
    # Tag.create(tag: params[:tag])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
