window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Main extends Backbone.View
  el: 'canvas#main'
  events: []

  initialize: ->
    _.bindAll(@, 'render', 'renderOne', 'error', 'clear')
    $(@el).width($('body').width())

    jaws.view = @
    jaws.canvas = $(@el)

    @game = new Typedown.Controllers.Game()
    jaws.start(@game)

    @stats = new Typedown.Views.Game.Stats()
    @clear()
    @render()
    @

  clear: ->
    @context = jaws.context
    @context.clearRect(0,0,jaws.width,jaws.height)
    clearTimeout(@clearing)
    @clearing = setTimeout(@clear, 5000)

  render: ->
    @context.textAlign = 'center'
    @context.textBaseline = 'middle'
    @renderOne(@game.position)

    @stats.render({level: @game.level})

  renderOne: (text)->
    rand = (b) -> Math.floor(Math.random() * b)
    seed = rand(1000)
    font_size = rand(100)
    @context.font = font_size+'px "Nova Square"'
    @context.fillStyle = 'rgba(' + [rand(255), 256-rand(64), 256-rand(64),Math.random()].join(',') + ')'
    @context.fillText(text, (seed*131)%@context.canvas.width,
      (seed*119)%@context.canvas.height)

  error: () ->
    @clear()
    @stats.render({level: jaws.level})
    @context.font = '20px "Nova Square"'
    @context.fillStyle = '#FFF'
    @context.fillText('ERROR', @context.canvas.width / 2, (@context.canvas.height / 2)-30)
    @context.fillText('You will live for only 1 more try', @context.canvas.width / 2, (@context.canvas.height / 2)+10)
