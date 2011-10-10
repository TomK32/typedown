//= require zepto.min.js
//= require underscore-min.js
//= require backbone-min
//= require typedown-backbone

//= require jaws

//= require_tree ./templates
//= require_tree ./models
//= require_tree ./views

$ ->
  window.game = new Typedown.Views.Game.Start()
  true
