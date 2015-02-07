require 'pry'
#=======================================================================================================

star_trek_deck = Deck.create(name: File.basename("db/decks/startrekdeck.txt", "deck.txt"))

star_trek_cards = File.foreach('db/decks/startrekdeck.txt') do |line|
                    card_text = line.split(',')
                    Card.create(word: card_text[0], definition: card_text[1].chomp, deck: star_trek_deck)
                  end

#=======================================================================================================

state_capitals_deck = Deck.create(name: File.basename("db/decks/statecapitalsdecknew.txt", "decknew.txt"))

state_capitals_cards = File.foreach('db/decks/statecapitalsdecknew.txt') do |line|
                        card_text = line.split(',')
                        Card.create(word: card_text[0], definition: card_text[1], deck: state_capitals_deck)
                      end

#=======================================================================================================

oop_deck = Deck.create(name: File.basename("db/decks/OOPdecknew.txt", "decknew.txt").downcase)

oop_cards = File.foreach('db/decks/OOPdecknew.txt') do |line|
              card_text = line.split(',')
              Card.create(word: card_text[0], definition: card_text[1], deck: oop_deck)
            end

#=======================================================================================================

git_commands_deck = Deck.create(name: File.basename("db/decks/gitcommandsdecknew.txt", "decknew.txt"))

git_commands_cards = File.foreach('db/decks/gitcommandsdecknew.txt') do |line|
                        card_text = line.split(',')
                        Card.create(word: card_text[0], definition: card_text[1], deck: git_commands_deck)
                    end

