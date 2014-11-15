    # create a new instance of the deck model -- creates a new deck
    #if the value of players hand is greater than 21 you get an alert that says "you lose"
    #some comparison when you stand
# ////////////////////////////////////////////////////////////////////////////////////////

# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'stand', => @dealerStandOrHit()

  getCurrentScore: (player) ->
      @get(player).minScore()

  dealerStandOrHit: ->
      if @get('dealerHand').first().get('revealed') is false
        @get('dealerHand').first().flip()
      self = @
      if @getCurrentScore('dealerHand') < 17
        @get('dealerHand').hit()
        setTimeout (->
          self.dealerStandOrHit()
          ), 1300
      else
        @compareScores()

  compareScores: ->
      player = @getCurrentScore('playerHand')
      dealer = @getCurrentScore('dealerHand')
      if dealer > player && dealer <= 21
        alert("Dealer Wins!!")
      else
        alert("Player Wins!!")



