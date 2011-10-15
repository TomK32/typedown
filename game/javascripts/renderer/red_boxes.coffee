window.Typedown.Renderer ||= {}

class window.Typedown.Renderer.RedBoxes extends Typedown.Renderer.Basic
  @levels: [5].concat [21..30]

  afterInit: ->
    @reset()

  reset: ->
    @drawBox(c*30 + @rand(20) - 10) for c in [1..(@context.canvas.width / 30)]
    
  drawBox: (x, boxes) ->
    w = @context.canvas.width/4*3
    h = @context.canvas.height
    x = (x * w) / boxes + (w/6)
    l = w / boxes
    y = h/4
    @context.lineWidth = 2
    @context.strokeStyle = @color(1-Math.random()/10)
    @context.beginPath()
    @context.moveTo(x+5, y+5)
    @context.lineTo(x+5, y+h/2-5)
    @context.lineTo(x+l-5, y+h/2-5)
    @context.lineTo(x+l-5, y+5)
    @context.lineTo(x+5, y+5)
    @context.stroke()
  
  color: (alpha)->
    'rgba(' + [255-@rand(10), 90-@rand(5), @rand(10), alpha||1].join(',') + ')'

  render: (text) ->
    @context.clearRect(0,0,jaws.width,jaws.height)
    @drawBox(c, text) for c in [0...text]

