# decks.rb
get '/decks' do
	@decks = Deck.all
	erb :'/users/decks'
end

get '/decks/:deck_id' do
	redirect '/login' unless session[:user_id]

	@deck = Deck.find(params[:deck_id])
	@round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id] )
	deck.cards.each do |card|
		Guess.create(round: round, card: card)
	end

	redirect '/decks/#{deck.id}/cards'
end


get '/decks/:deck_id/cards' do
	puts params

	erb :'/rounds/cards/card'
end

post '/decks/:deck_id/cards' do
	puts params
	until no_cards # need to make this method
		@available_cards = []

		Guess.where(round: round, correct?: false).each do |guess|
			@available_cards << Card.find(guess.card_id)
		end
		@card = @available_cards.sample

		erb :'/rounds/cards/card'
	end

	erb :'/rounds/deck_complete'
end


get '/decks/:deck_id/cards/evaluate' do

end

post '/decks/:deck_id/cards/evaluate' do


	erb :'/rounds/cards/card_complete'
end

