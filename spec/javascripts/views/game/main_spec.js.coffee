describe "Main", ->
  beforeEach ->
    game_content()
    @view = new Typedown.Views.Game.Main()
  it "should render", ->
    @view.render()
