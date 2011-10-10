describe "Game", ->
  beforeEach ->
    @game = new Typedown.Models.Game()
  it "should have player", ->
    expect(@game.player).toBeDefined()
