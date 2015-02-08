# index.rb
get '/' do
  erb :index
end

get '/logins' do
	erb :"/logins"
end

post '/logins' do
  puts params
  user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
	if user
		session[:user_id] = user.id
		redirect '/decks'
	else
    @error = "try again"
		erb :"/logins"
	end
end
