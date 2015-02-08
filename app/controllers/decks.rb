# decks.rb
get '/decks' do
	erb :'/deck'
end

post '/decks/:deck_id' do
	deck = Deck.find(params[:deck_id])
	round = Round.create(user_id: session[:user_id], deck_id: params[:deck_id] )
	
	deck.cards.each do |card|
		Guess.create(round: round, card: card)
	end
	redirect '/decks/deck.id/cards'
end

get '/decks/:deck_id/cards' do

	while 
		@available_cards = []

		Guess.where(round: round, correct?: false).each do |guess|
			@available_cards << Card.find(guess.card_id)
		end
		@card = @available_cards.sample

		erb: '/decks/deck.id/cards/'
	end
end

