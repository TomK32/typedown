window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Main extends Backbone.View
  el: '#game'
  template: JST["templates/game/main"]
  events:
    "keyup window": ""
    "form submit": "start"

  initialize: ->
    @render()
    @

  render: ->
    $(@.el).html(@.template)

  start: (event) ->
    event.preventDefault();
    console.log("sad");