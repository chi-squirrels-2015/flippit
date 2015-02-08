class Deck < ActiveRecord::Base

  has_many :cards
  has_many :rounds

  def no_cards
    #should return true/false?
  end
end
