class Typedown.Controllers.Game
  level: 1
  position: 1

  initialize: ->

  setup: ->
    _.bindAll(@, 'pressed')
    jaws.on_keydown([0..9].join('').split(''), @pressed)

  pressed: (key) ->
    if parseInt(key) == @position
      @nextPosition()
    else
      jaws.view.error()
      @position = @level

  nextPosition: ->
    @position -= 1
    if @position == 0
      @level += 1
      @position = @level
      jaws.view.clear()

  draw: ->
    jaws.view.render()
