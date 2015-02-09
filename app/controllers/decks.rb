# decks.rb
get '/decks' do
	@decks = Deck.all
	erb :'/users/decks'
end

get '/decks/:deck_id' do
	redirect '/login' unless session[:user_id]

	@deck = Deck.find(params[:deck_id])
	round = Round.find_or_create_by(user_id: session[:user_id], deck_id: params[:deck_id] )
	session[:round_id] = round.id
	@deck.cards.each do |card|
		Guess.create(round: @round, card: card)
	end

	redirect "/decks/#{@deck.id}/round"
end


get '/decks/:deck_id/round' do #this route sets up the card to be guessed
	redirect '/login' unless session[:user_id]
	@deck = Deck.find(params[:deck_id])
	@round = Round.find(session[:round_id])
	@card = @deck.cards.sample

	answers = @deck.cards.pluck(:word).sample(3)
	answers << @card.word
	@choices = answers.shuffle

	erb :'/rounds/cards/card'
end

post '/decks/:deck_id/round/:round_id' do #this route sets up the card to be guessed
	redirect '/login' unless session[:user_id]
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

get '/decks/:deck_id/:card_id/evaluate' do
	puts params
	@card = Card.where(deck_id: params[:deck_id], id: params[:card_id])
	puts @card
end

post '/decks/:deck_id/:card_id/evaluate' do
	puts params

	erb :'/rounds/cards/card_complete'
end

