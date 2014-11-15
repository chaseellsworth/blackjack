class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true


# initialize cards 0 to 52 by calling a new instance of the  card on every one, and then shuffle. It also gives the card a rank and a suit.
# deal Player creates a new instance of the hand collection -- creates a new hand by popping two off in a revealed state
# deal Player creates a new instance of the hand collection -- creates a new hand by popping two off and then hiding one by flipping it
