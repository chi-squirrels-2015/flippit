class Round < ActiveRecord::Base

	belongs_to :user
	belongs_to :deck
	has_many	 :guesses

  def no_cards
    self.guesses.all?(&:correct?)
  end

end
