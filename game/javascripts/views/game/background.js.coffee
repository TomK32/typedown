window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Background extends Backbone.View
  el: 'canvas#background'
  letters: 'typedown'.split('')
  context: null

  initialize: ->
    _.bindAll(@, 'render', 'clear')
    # necessary or it looks ugly scaled
    @context =  $(@.el)[0].getContext('2d')
    setInterval(@render, 300, @)
    setInterval(@clear, 20000, @)
    @clear()
    @render()
    @

  render: ->
    @renderOne(letter) for letter in @letters

  clear: ->
    @context.save();
    @context.setTransform(1, 0, 0, 1, 0, 0);
    @context.clearRect(0, 0, @context.canvas.width, @context.canvas.height);
    @context.restore();

  renderOne: (letter) ->
    rand = (b) -> Math.floor(Math.random() * b)
    seed = rand(1000)
    font_size = rand(100)
    @context.font = font_size+'px "Nova Square"'
    @context.fillStyle = 'rgba(' + [rand(255), 256-rand(64), 256-rand(64),Math.random()].join(',') + ')'
    @context.fillText(letter, (seed*131)%(@context.canvas.width+font_size)-font_size, (seed*119)%(@context.canvas.height+2*font_size)-font_size)
    true


