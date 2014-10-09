
get '/' do
  logged_in = true #Test toggle
  if logged_in
  #Logged in home page
    erb :index
  else
  #Prior to logging in splash page
    erb :login
  end
end

post '/users' do
  #Add validation, setup session
  #and store session[:user_id]
  user = User.find(params[:id])
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
