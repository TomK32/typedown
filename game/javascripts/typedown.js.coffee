//= require zepto.min.js
//= require underscore-min.js
//= require backbone-min
//= require typedown-backbone

//= require jaws

//= require_tree ./controllers
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./views

$(document).ready ->
  window.game = new Typedown.Views.Game.Start()
  $('[name=player_name]').focus()
  true
