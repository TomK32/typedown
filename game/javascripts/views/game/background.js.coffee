window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Background extends Backbone.View
  el: 'canvas#background'
  letters: 'typedown'.split('')
  context: null

  initialize: ->
    _.bindAll(@, 'render', 'clear')
    # necessary or it looks ugly scaled
    @context =  $(@.el)[0].getContext('2d')
    @clear()
    setInterval(@render, 500, @)
    setInterval(@clear, 20000, @)
    @render()
    @

  render: ->
    @renderOne(letter) for letter in @letters

  clear: ->
    $(@.el).attr('width', $(@.el).width());
    $(@.el).attr('height', $(@.el).height());
    @context.save();
    @context.setTransform(1, 0, 0, 1, 0, 0);
    @context.clearRect(0, 0, @context.canvas.width, @context.canvas.height);
    @context.restore();

  renderOne: (letter) ->
    rand = (b) -> Math.floor(Math.random() * b)
    seed = rand(1000)
    @context.font = rand(100)+'px "Nova Square"'
    @context.fillStyle = 'rgba(' + [rand(255), 256-rand(64), 256-rand(64),Math.random()].join(',') + ')'
    @context.fillText(letter, (seed*131)%@context.canvas.width, (seed*119)%@context.canvas.height)
    true


