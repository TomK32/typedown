//= require zepto.min.js
//= require underscore-min
//= require backbone-min
//= require typedown-backbone

//= require audio.js
//= require jsfx.js
//= require jsfxlib.js
//= require jaws

//= require_tree ./controllers
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./views
//= require_tree ./renderer

$(document).ready ->
  window.game = new Typedown.Views.Game.Start()
  if document.body && document.body.offsetWidth
    winW = document.body.offsetWidth
    winH = document.body.offsetHeight

  if (document.compatMode=='CSS1Compat' && document.documentElement && document.documentElement.offsetWidth )
    winW = document.documentElement.offsetWidth
    winH = document.documentElement.offsetHeight

  if (window.innerWidth && window.innerHeight)
    winW = window.innerWidth
    winH = window.innerHeight

  $('#main').attr('height', winH).attr('width', winW);
  $('[name=player_name]').focus()
  true
