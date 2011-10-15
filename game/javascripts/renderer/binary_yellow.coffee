window.Typedown.Renderer ||= {}

class window.Typedown.Renderer.BinaryYellow extends Typedown.Renderer.Basic
  @levels: [4].concat [16..20]

  afterInit: ->
    @reset()

  reset: ->
    @drawBox(c*30 + @rand(20) - 10) for c in [1..(@context.canvas.width / 30)]
    
  drawBox: (x, boxes, isTrue) ->
    w = @context.canvas.width/4*3
    h = @context.canvas.height
    x = (x * w) / boxes + (w/6)
    l = w / boxes
    y = h/4
    @context.fillStyle = @darkYellow() if isTrue
    @context.fillStyle = @lightYellow() if !isTrue
    @context.beginPath()
    @context.moveTo(x+5, y+5)
    @context.lineTo(x+5, y+h/2-5)
    @context.lineTo(x+l-5, y+h/2-5)
    @context.lineTo(x+l-5, y+5)
    @context.lineTo(x+5, y+5)
    @context.fill()
  
  darkYellow: (alpha)->
    'rgba(' + [255-@rand(10), 160-@rand(5), @rand(10), alpha||1].join(',') + ')'
  lightYellow: (alpha)->
    'rgba(' + [255-@rand(10), 240-@rand(5), @rand(10), alpha||1].join(',') + ')'

  render: (text) ->
    @context.clearRect(0,0,jaws.width,jaws.height)
    boolean = new Number(parseInt(text)).toString(2).split('')
    @drawBox(c, boolean.length, boolean[c] == '1') for c in [0...boolean.length]

