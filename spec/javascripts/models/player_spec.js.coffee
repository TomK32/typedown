describe "Player", ->
  beforeEach ->
    @player = new Typedown.Models.Player({name: 'Thomas'})
  describe "attributes", ->
    it "should have name", ->
      expect(@player.attributes.name).toEqual 'Thomas'
