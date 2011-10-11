class Typedown.Controllers.Game
  setup: ->
    _.bindAll(@, 'pressed')
    $('#game').width($('body').width()).height($('body').height())
    jaws.canvas = $('#game')
    jaws.on_keydown([0..9].join('').split(''), @pressed)
    @context = jaws.context
    @context.clearRect(0,0,jaws.width,jaws.height)

  pressed: (key) ->
    rand = (b) -> Math.floor(Math.random() * b)
    seed = rand(1000)
    font_size = rand(100)
    @context.font = font_size+'px "Nova Square"'
    @context.fillStyle = 'rgba(' + [rand(255), 256-rand(64), 256-rand(64),Math.random()].join(',') + ')'
    @context.fillText(key, (font_size+((seed*131)%(@context.canvas.width-2*font_size))),
      (font_size+((seed*119)%(@context.canvas.height-2*font_size))))

  draw: ->
