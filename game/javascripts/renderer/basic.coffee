window.Typedown.Renderer ||= {}

class window.Typedown.Renderer.Basic

  constructor: (context) ->
    @context = context
    if @afterInit
      _.bindAll(@, 'afterInit')
      @afterInit.call()

  reset: ->
    #

  seed: ->
    @rand(@context.canvas.width * @context.canvas.height * 3)

  rand: (b) ->
    Math.floor(Math.random() * b)

  render: (text) ->
    font_size = @rand(100)
    seed = @seed()
    @context.font = font_size+'px "Nova Square"'
    @context.fillStyle = 'rgba(' + [@rand(255), 256-@rand(64), 256-@rand(64), Math.random()].join(',') + ')'
    @context.fillText(text, (seed*131)%@context.canvas.width, (seed*119)%@context.canvas.height)