class Deck < ActiveRecord::Base

  has_many :cards
  has_many :rounds

  def no_cards
    #should return true/false?
  end

  def next_card(current_card_id)
    @deck.cards.find(current_card_id+1)
  end
end
