enable :sessions

get '/' do
  erb session[:user_id] ? :index : :login
end

post '/login' do
  user = User.find(params[:username])
  if user && params[:password] == user.password_hash
    session[:user_id] = user.id
    @username = user.username
  else
    @errors = "Try again"
  end
  redirect '/'
end

<<<<<<< HEAD
post '/signup' do
  redirect '/'
end
=======
post '/signup' do
  user = User.create(params)
  if user.valid?
    session[:user_id] = user.id
    @username = user.username
  else
    @errors = "Much try again"
  end
  redirect '/'
end
>>>>>>> 1bd0cb0f6584aca195e59a255c40f8e87f2236bc

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
