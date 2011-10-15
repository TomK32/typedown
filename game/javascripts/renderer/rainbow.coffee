window.Typedown.Renderer ||= {}

class window.Typedown.Renderer.Rainbow extends Typedown.Renderer.Basic
  @levels: [3].concat [7..9]

  afterInit: ->
    @reset()

  reset: ()->
    @font_size = 10
    @context.save()
    gradient = @context.createLinearGradient(0,0,@context.canvas.width,0)
    gradient.addColorStop(0, "rgba(255, 0, 0, 1)")
    gradient.addColorStop(0.15, "rgba(255, 255, 0, 1)")
    gradient.addColorStop(0.3, "rgba(0, 255, 0, 1)")
    gradient.addColorStop(0.5, "rgba(0, 255, 255, 1)")
    gradient.addColorStop(0.65, "rgba(0, 0, 255, 1)")
    gradient.addColorStop(0.8, "rgba(255, 0, 255, 1)")
    gradient.addColorStop(1, "rgba(255, 0, 0, 1)")
    @context.strokeStyle = gradient
    @context.lineWidth = 1
    @drawLine(x*4) for x in [0..@context.canvas.width/4]
    @context.restore()

  drawLine: (x) ->
    @context.beginPath()
    @context.moveTo(x, 0)
    @context.lineTo(x, @context.canvas.height)
    @context.stroke()

  render: (text) ->

    seed = @seed()
    @font_size ||= 1
    @font_size = @font_size + 1
    @reset() if @font_size > 200

    @context.fillStyle = '#000000'
    @context.strokeStyle = '#FFFFFF'
    @context.font = @font_size + 'px "Nova Square"'

    @context.strokeText(text, @context.canvas.width/2.0 - 100, @context.canvas.height/2.0)
    @context.fillText(text, @context.canvas.width/2.0 - 100, @context.canvas.height/2.0)

