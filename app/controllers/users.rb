# users.rb
get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  puts params
	user = User.new
	user.name = params[:name]
	user.password= params[:password]
	if user.save
		redirect '/decks'
	else
		erb :'users/new'
	end
end

