require 'sinatra/base'
require './models/link'
require './models/user'
require_relative 'data_mapper_setup'

ENV['RACK_ENV']||='development'

class Bookmark_Manager < Sinatra::Base
  enable :sessions

  get '/sign-up' do
    erb(:sign_up)
  end

  get '/' do
    @username = session[:username]
    @links = Link.all
    erb(:index)
  end

  get '/new' do
    erb(:new)
  end

  post "/user" do
    User.create(username: params[:username], password: params[:password])
    User.increase
    session[:username] = params[:username]
    redirect to'/'
  end

  post '/' do
    link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tag].split(',')
    tags.each do |tag|
      tag = Tag.first_or_create(name: "#{tag}")
      link.tags << tag
    end
    link.save
    redirect '/'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'index'
  end

  get '/search' do
    redirect "/tags/#{params[:name]}"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
