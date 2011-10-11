window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Stats extends Backbone.View
  el: 'canvas#stats'
  events: []
  last_options: {}

  initialize: ->
    @context = $(@el)[0].getContext('2d')
    @

  render: (options) ->
    $.extend(@last_options, options)
    @context.fillStyle = '#002'
    @context.fillRect(0,0,@context.canvas.width, @context.canvas.height)
    return if Math.random() < 0.1
    @context.font = '12px "Nova Square"'
    @context.fillStyle = '#AAF'
    @context.fillText('Level: ' + @last_options.level, 0, @context.canvas.height-4)

