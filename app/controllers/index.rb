# index.rb
get '/' do
  erb :index
end

get '/logins' do
	erb :"/logins"
end

post '/logins' do	
	if user = User.find_by(name: params[:user]["name"]).try(:authenticate, params[:user]["password"])
		session[:user_id] = user.id
		redirect '/decks'
	else
		erb :"/logins"
	end
end

post '/' do

end
