window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Start extends Backbone.View
  el: '#game'
  template: JST["templates/game/start"]
  events:
    "click #start": "start"
    "form submit": "start"

  initialize: ->
    @render()
    @background = new Typedown.Views.Game.Background()

    @

  render: ->
    $(@.el).html(@.template)

  start: (event) ->
    event.preventDefault();
    @background.remove()
    @remove()
    window.game = new Typedown.Views.Game.Main()
