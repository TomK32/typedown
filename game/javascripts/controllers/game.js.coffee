class Typedown.Controllers.Game
  level: 1
  position: 1
  currentNumber: ''

  initialize: ->
    #

  setup: ->
    _.bindAll(@, 'pressed')
    jaws.on_keydown([0..9].join('').split(''), @pressed)

  pressed: (key) ->

    if parseInt(key) == @position
      @nextPosition()
    else if String(@position) == @currentNumber + String(key)
      @nextPosition()
    else if String(@position).match(new RegExp(@currentNumber + String(key)))
      @currentNumber += String(key)
    else
      @currentNumber = ""
      jaws.view.error()
      @position = @level

  nextPosition: ->
    @currentNumber = ""
    @position -= 1
    if @position == 0
      @level += 1
      @position = @level
      jaws.view.clear()

  draw: ->
    jaws.view.render()
