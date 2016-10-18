require 'sinatra/base'

class Bookmark_Manager < Sinatra::Base
  get '/' do
    'Hello Bookmark_Manager!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
