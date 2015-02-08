# index.rb
get '/' do
  erb :index
end

get '/logins' do
	erb :"/logins"
end

post '/logins' do
  puts params
	if params[:name] == User.find_by(name: params[:name]).try(:authenticate, params[:password])
		session[:user_id] = user.id
		redirect '/decks'
	else
    @error = "try again"
		erb :"/logins"
	end
end
