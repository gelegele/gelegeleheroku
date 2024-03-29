require 'rubygems'
require 'sinatra/base'
require 'rack/rewrite'

class App < Sinatra::Base
  enable :inline_templates
  #enable :logging

  #http://localhost:4567/name/foo と http://localhost:4567/song_for/foo で同じ画面
  use Rack::Rewrite do
    rewrite %r{^/song_for/(.*)}, '/name/$1'
  end

  get '/' do
     @title = "Top"
     haml "My Way"
  end

  get '/name/:name' do
    @name = params[:name]
    @title = "Song for #{@name}"
    haml "#{@name}'s Way"
  end

end

App.run!

__END__

@@ layout
!!! 5
%html
 %head
  %title= @title
 %body
  %h1= @title
  %div= yield
  aaaaa

