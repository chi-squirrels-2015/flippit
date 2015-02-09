class Deck < ActiveRecord::Base

  has_many :cards
  has_many :rounds


  def next_card(current_card_id)
    @deck.cards.find(current_card_id+1)
  end

end
