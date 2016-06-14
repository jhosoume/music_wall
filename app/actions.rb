# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end 

get '/songs/new' do
  @song = Song.new
  erb :'/songs/new'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
  )
  if @song.save
    redirect '/songs'
  else 
    erb :'/songs/new'
  end
end

get '/login' do
  erb :'login'
end

get '/signup' do
  erb :'signup'
end

post '/signup' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/'
  else
    erb :'/signup'
  end
end
