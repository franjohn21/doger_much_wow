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

post '/signup' do
end

post '/logout' do
  session.clear
  redirect '/'
end

get '/users/:username' do
  erb :show
end

post '/doge' do
  # params[:content]
  # session[:user_id]
  # Create new Tweet with content, user_id
  # Redirect to forms' current page
end

get '/users/:username/status/:id' do
  #@doge = Doge.find(params[:id])
  erb :doge_show
end

delete '/doge' do
  #bad_doge = Doge.destroy(params[:id])
  redirect '/'
end
