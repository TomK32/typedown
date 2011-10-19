window.Typedown.Renderer ||= {}

class window.Typedown.Renderer.BasicGreen extends Typedown.Renderer.Basic
  @levels: [2].concat [10..15]

  drawLine: (x, lines) ->
    x = (x * @context.canvas.width / lines) + (@context.canvas.width/lines)/2
    @context.strokeStyle = @color(0.2)
    @context.lineWidth = @context.canvas.width / 20 / lines
    @context.beginPath()
    @context.moveTo(x, 0)
    @context.lineTo(x, @context.canvas.height)
    @context.stroke()
    @context.strokeStyle = @color(0.2)
    @context.moveTo(x+4, 0)
    @context.lineTo(x+4, @context.canvas.height)
    @context.stroke()
    @context.strokeStyle = @color(0.2)
    @context.moveTo(x+10, 0)
    @context.lineTo(x+10, @context.canvas.height)
    @context.stroke()
  
  color: (alpha )->
    'rgba(' + [@rand(5), 256-@rand(5), @rand(5), alpha||1].join(',') + ')'

  render: (text) ->
    @context.clearRect(0,0,jaws.width,jaws.height)
    @drawLine(c, text) for c in [0...text]
