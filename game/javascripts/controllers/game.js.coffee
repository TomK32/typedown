class Typedown.Controllers.Game
  defaults:
    level: 1
    position: 1
    currentNumber: ''
    lives: 3
    error: false

  constructor: ->
    @

  setup: ->
    _.bindAll(@, 'removeError', 'pressed')
    jaws.on_keydown([0..9].join('').split(''), @pressed)
    @sounds = new Typedown.Controllers.Sounds()
    _.extend(@, @defaults)

  pressed: (key) ->
    return if @error

    if parseInt(key) == @position
      @nextPosition()
    else if String(@position) == @currentNumber + String(key)
      @nextPosition()
    else if String(@position).match(new RegExp(@currentNumber + String(key)))
      @currentNumber += String(key)
    else
      @currentNumber = ""
      @lives -= 1
      @sounds.play('error')
      if @lives > 0
        jaws.view.error(@level, @lives)
        @error = true
        @error = setTimeout(@removeError, 300)
        @position = @level
      else
        clearTimeout(@error)
        @error = true
        jaws.game_loop.stop()
        jaws.view.gameOver()

  removeError: () ->
    jaws.view.clear()
    @error = false

  nextPosition: ->
    @currentNumber = ""
    @position -= 1
    if @position == 0
      @level += 1
      @position = @level
      jaws.view.nextLevel()
      @sounds.play('nextLevel')
      if @level % 5 == 0
        @lives += 1
        jaws.view.bonusLife()
        @sounds.play('bonusLife')

  draw: ->
    if !@error
      jaws.view.render()
