window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Main extends Backbone.View
  el: 'canvas#main'
  events: []

  initialize: ->
    _.bindAll(@, 'render', 'renderOne', 'error', 'clear')

    jaws.view = @
    jaws.canvas = $(@el)

    @game = new Typedown.Controllers.Game()
    jaws.start(@game, {})
    @context = jaws.context

    @stats = new Typedown.Views.Game.Stats()
    @nextLevel()
    @render()
    @

  nextLevel: ->
    @renderer = new (@renderers(@game.level))(@context)
    @clear()

  clear: ->
    @context.clearRect(0,0,jaws.width,jaws.height)
    @renderer.reset()
    clearTimeout(@clearing)
    @clearing = setTimeout(@clear, 5000)

  render: ->
    @context.textAlign = 'center'
    @context.textBaseline = 'middle'
    @renderOne(@game.position)

    @stats.render({level: [@game.position, @game.level].join('/')})

  renderOne: (text)->
    @renderer.render(text)

  error: () ->
    @clear()
    @stats.render({level: jaws.level})
    @context.font = '40px "Nova Square"'
    @context.fillStyle = '#FFF'
    @context.fillText('ERROR', @context.canvas.width / 2, (@context.canvas.height / 2)-40)
    @context.fillText('You will live for only 1 more try', @context.canvas.width / 2, (@context.canvas.height / 2)+20)

  renderers: (level) ->
    r = for renderer of Typedown.Renderer
      do (renderer) ->
        renderer = Typedown.Renderer[renderer]
        return renderer if !renderer.levels || _.indexOf(renderer.levels, parseInt(level)) >= 0
    _.last(_.compact(r))
