# users.rb
post '/users/new' do
	user = User.new
	user.name = params[:name]
	user.password= params[:password]
	if user.save
		redirect '/decks'
	else
		erb :'users/new'
	end
end

