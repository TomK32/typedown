window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Background extends Backbone.View
  el: '#background'
  letters: 'typedown'.split('')

  initialize: ->
    _.bindAll(@, 'render')
    setInterval(@render, 1000, @)
    @render()
    @

  render: ->
    $(@.el).html('')
    @renderOne(letter) for letter in @letters

  renderOne: (letter) ->
    $(@.el).append('<span style="' + @.randomStyle() + '">' + letter + '</span>')

  randomStyle: ->
    rand = (b) -> Math.floor(Math.random() * b)
    seed = rand(1000)
    [
      'font-size:' + (seed/5) + 'px'
      'color:rgb(' + [rand(256), 256-rand(64), 256-rand(64)].join(',') + ')'
      'opacity:' + ((seed%100)/100)
      'top:' + ((seed*131)%95) + '%'
      'left:' + ((seed*119)%95) + '%'
    ].join(';')