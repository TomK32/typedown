window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Main extends Backbone.View
  el: 'canvas#main'
  events: []

  initialize: ->
    _.bindAll(@, 'render', 'renderOne', 'error', 'clear', 'start')

    jaws.view = @
    jaws.canvas = $(@el)
    @game = new Typedown.Controllers.Game()
    @start()
    @

  start: ->
    jaws.start(@game, {})
    @context = jaws.context
    @stats = new Typedown.Views.Game.Stats()
    @nextLevel()
    @render()
    @clear()
    @

  restart: ->
    @clear()
    @game.setup()
    @

  nextLevel: ->
    @renderer = new (@renderers(@game.level))(@context)
    @clear()

  bonusLife: ->
    @stats.bonusLife()

  clear: ->
    @context.clearRect(0,0,jaws.width,jaws.height)
    @renderer.reset()
    clearTimeout(@clearing)
    @clearing = setTimeout(@clear, 5000)
    @stats.render({lives: @game.lives, level: [@game.position, @game.level].join('/')})

  render: ->
    @context.textAlign = 'center'
    @context.textBaseline = 'middle'
    @renderOne(@game.position)
    @stats.render({lives: @game.lives, level: [@game.position, @game.level].join('/')})

  renderOne: (text)->
    @renderer.render(text)

  error: (level, lives) ->
    @clear()
    @stats.render(level)
    @renderText(['ERROR', 'You will live for only ' + lives + ' more try'])
    clearTimeout(@clearing)
    $(window).mousedown(@start)

  gameOver: () ->
    @render()
    @renderText(['ERROR', 'Game Over!'])
    clearTimeout(@clearing)

  # text must be array
  renderText: (text) ->
    @context.font = '40px "Nova Square"'
    @context.fillStyle = '#FFF'
    @context.strokeStyle = '#000'
    @context.lineWidth = '2'
    for i in [0...(text.length)]
      line = text[i]
      @context.strokeText(line, @context.canvas.width / 2, (@context.canvas.height / 2)-40 + i*40)
      @context.fillText(line, @context.canvas.width / 2, (@context.canvas.height / 2)-40 + i*40)

  renderers: (level) ->
    r = for renderer of Typedown.Renderer
      do (renderer) ->
        renderer = Typedown.Renderer[renderer]
        return renderer if !renderer.levels || _.indexOf(renderer.levels, parseInt(level)) >= 0
    _.last(_.compact(r))
