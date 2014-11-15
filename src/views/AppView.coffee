class window.AppView extends Backbone.View
  template: _.template '
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header something">

          <a class="navbar-brand" href="#">Blackjack</a>
        </div>
        <div class="form-group">
          <button class="hit-button btn btn-success">Hit</button> <button class=" btn stand-button btn-info">Stand</button>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="player-hand-container col-md-6 col-md-offset-3 text-center "></div>
    <div class="dealer-hand-container col-md-6 col-md-offset-3 text-center"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()

    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    # $('.something').append( (@$el.html @template ) )
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

