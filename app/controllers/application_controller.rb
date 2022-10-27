class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  #Read
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end

  get "/api/users" do
    users = User.all 
    users.to_json(include: :songs)
  end

  get "/api/users" do
    users = User.all
  end

  get "/api/users/:id" do
    users = User.find(params[:id])
    users.to_json(include: {
                    collections: {
                      include: [:song]
                    }
    })
  end



  get "/api/users/user_search/:username" do
    user = User.find_by(username: params[:username])
    user.to_json(include: [:songs])
  end



  post "/api/users/:id/" do
    
    songs = Song.create(title: params[:title], artist: params[:artist], genre: params[:genre])
    songs.to_json
    collections = Collection.create(song_rating: params[:song_rating], user_id: params[:user_id], song_id: Song.last.id)
  
    collections.to_json
  
  end


  get "/api/songs/:id" do
    songs = Song.find(params[:id])
    songs.to_json(include: :collections)

  end


  get "/api/collections/:id" do
    collections = Collection.find(params[:id])
    collections.to_json(include:  [:song])
  end

  patch "/api/collections/:id" do
    collections = Collection.find(params[:id])
    collections.update(
        song_rating: params[:song_rating]

    )
    collections.to_json(include:  [:song])
  
  end




  # delete
  delete '/api/songs/:id' do
    collections = Collection.find(params[:id])
    collections.destroy.to_json(include:  [:song])
    songs  = Song.find(params[:id])
    songs.destroy.to_json
  end
  # returns the average rating for a song
  get '/average-song-rating/:id' do

    songs = Song.find(params[:id]).average_rating
    songs.to_json
  end




end
