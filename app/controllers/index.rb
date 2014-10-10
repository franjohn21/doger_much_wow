
enable :sessions

get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :index
  else
    erb :login
  end
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && params[:password] == @user.password_hash
    session[:user_id] = @user.id
  else
    @errors = "Try again"
  end
  redirect '/'
end

post '/signup' do
  @user = User.create(params)
  if @user.valid?
    session[:user_id] = @user.id
  else
    @errors = "Much try again"
  end
  redirect '/'
end

post '/logout' do
  session.clear
  redirect '/'
end


get '/users/:username' do
  @user = User.find_by(username: params[:username])
  @doges = @user.doges
  erb :show
end

post '/doge' do
  Doge.create(content: params[:content], user_id: session[:user_id])
  redirect '/'
  #*** Stretch goal: Redirect to forms' current page
end

post '/very_wow' do
  user = User.find(session[:user_id])
  doge = Doge.find(params[:doge])
  user.very_wows << doge
  redirect '/'
end

get '/users/:username/status/:id' do
  @doge = Doge.find(params[:id])
  @user = User.find_by(username: params[:username])
  erb :doge_show
end

delete '/users/:username/status/:id' do
  user = User.find(session[:user_id])
  if user.username == params[:username]
    Doge.destroy(params[:id])
  else
    @errors = "No such doge deletion for you!"
  end
  redirect '/'
end
