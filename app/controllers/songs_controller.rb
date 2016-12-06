require "sinatra/base"
require "rack-flash"
require "pry"

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    # list of all songs
    # each song w/ clickable link
    # "The Greatest"
    # binding.pry
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    # song's show page should have links for artist and each genre association
    # "testing"
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
