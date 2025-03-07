class ApplicationController < Sinatra::Base

  get '/games' do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  get '/games/:id' do
    game = Game.find(params[:id])
    game.to_json(only: [:id, :title, :genre, :price], include: {
      reviews: {only: [:comment, :score], include: {
        user: {only: [:name]}
      }}
    })
  end

end
