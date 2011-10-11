window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Start extends Backbone.View
  el: '#game'
  template: JST["templates/game/start"]
  events:
    "click #start": "start"
    "form submit": "start"

  initialize: ->
    @render()
    @

  render: ->
    $(@.el).html(@.template)

  start: (event) ->
    event.preventDefault();
