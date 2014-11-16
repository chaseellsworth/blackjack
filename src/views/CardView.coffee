class window.CardView extends Backbone.View
  className: 'card '


  template: _.template ''

  initialize: -> @render()

  render: ->
    if @model.get('revealed') is false
      @$el.css({"background-image": "url('img/card-back.png')"})
    else if typeof @model.get('rankName') is 'string'
      backgroundImageRankName = @model.get('rankName').toLowerCase()
    else
      backgroundImageRankName = @model.get('rankName')
      backgroundImageSuitName = @model.get('suitName').toLowerCase()
      @$el.children().detach()
      @$el.css({"background-image": "url('img/cards/" + backgroundImageRankName + '-' + backgroundImageSuitName + ".png')"})
      @$el.html @template @model.attributes
      @$el.addClass 'covered' unless @model.get 'revealed'




