window.Typedown.Views.Game ||= {}

class Typedown.Views.Game.Main extends Backbone.View
  el: '#game'
  template: JST["templates/game/main"]
  events: []

  initialize: ->
    @game_controller = jaws.start(Typedown.Controllers.Game)
    @render()
    @

  render: ->
    $(@.el).html(@.template)
