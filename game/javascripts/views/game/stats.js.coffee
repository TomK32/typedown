window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Stats extends Backbone.View
  el: 'canvas#stats'
  events: []
  last_options: {}

  initialize: ->
    _.bindAll(@, 'start')
    @context = $(@el)[0].getContext('2d')
    @

  start: ->
    @stopped = false

  render: (options) ->
    return if @stopped
    $.extend(@last_options, options)
    @context.fillStyle = '#002'
    @context.fillRect(0,0,@context.canvas.width, @context.canvas.height)
    return if Math.random() < 0.05
    @context.font = '12px "Nova Square"'
    @context.fillStyle = '#AAF'
    @context.fillText('Level: ' + @last_options.level, 4, @context.canvas.height-14)
    @context.fillText('Lives: ' + @last_options.lives, 4, @context.canvas.height-4)

  bonusLife: ->
    @stopped = true
    setTimeout(@start, 1000)
    @context.save()
    @context.textAlign = 'center'
    @context.textBaseline = 'middle'
    @context.fillStyle = '#FB0'
    @context.strokeSTyle = '#000'
    @context.lineWidth = '1.2'
    @context.fillRect(0,0,@context.canvas.width, @context.canvas.height)
    @context.font = '20px "Nova Square"'
    @context.fillStyle = '#FFF'
    @context.strokeText('Bonus Live!', @context.canvas.width/2, @context.canvas.height/2)
    @context.fillText('Bonus Live!', @context.canvas.width/2, @context.canvas.height/2)
    @context.restore()
