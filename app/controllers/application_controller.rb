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

  get "/api/user/:username" do
    user = User.find(params[:username])
    user.to_json
  end



  post "/api/users/:id/" do
    
    songs = Song.create(title: params[:title], artist: params[:artist], genre: params[:genre])
    songs.to_json
    collections = Collection.create(song_rating: params[:song_rating], user_id: params[:user_id], song_id: Song.last.id)
  
    collections.to_json
  
  end



end
