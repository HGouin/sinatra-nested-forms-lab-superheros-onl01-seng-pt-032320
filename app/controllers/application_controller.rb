require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :super_hero
      end
    
      post '/teams' do
        params[:team][:member].each {|hero| SuperHero.new(name: hero[:name], power: hero[:power], bio: hero[:bio])}
        @super_heroes = SuperHero.all
        @team = Team.new(name: params[:team][:name], motto: params[:team][:motto])
        erb :team
      end
end
