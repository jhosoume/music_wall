helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

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
  if current_user
    redirect '/'
  end
  @user = User.new
  erb :'login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    @login_error = true
    erb :'/login'
  end
end

get '/signup' do
  if current_user
    redirect '/'
  end
  @user = User.new
  erb :'signup'
end

post '/signup' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'/signup'
  end
end


get '/logout' do
  session.clear
  redirect '/'
end

