#=======================================================================================================

star_trek_deck = Deck.create(name: File.basename("db/decks/startrekdeck.txt", "deck.txt"))

star_trek_cards = File.foreach('db/decks/startrekdeck.txt') do |line|
                    card_text = line.split(',')
                    Card.create(word: card_text[0], definition: card_text[1], deck: star_trek_deck.id)
                  end

#=======================================================================================================

git_commands_deck = Deck.create(name: File.basename("db/decks/gitcommandsdeck.txt", "deck.txt"))

git_commands_deck = File.foreach('db/decks/gitcommands.txt') do |line|
                      Card.create(word: line[0], definition: line[1], deck: git_commands_deck.id)
                    end

#=======================================================================================================

state_capitals_deck = Deck.create(name: File.basename("db/decks/statecapitalsdeck.txt", "deck.txt"))

state_capitals_deck = File.foreach('db/decks/statecapitalsdeck.txt') do |line|
                        Card.create(word: line[0], definition: line[1], deck: state_capitals_deck.id)
                      end

#=======================================================================================================

oop_deck = Deck.create(name: File.basename("db/decks/OOPdeck.txt", "deck.txt").downcase)

oop_deck =  File.foreach('db/decks/OOPdeck.txt') do |line|
              Card.create(word: line[0], definition: line[1], deck: oop_deck.id)
            end
