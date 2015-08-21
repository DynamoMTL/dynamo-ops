#
#
# Hero
#
#
Hero =

  #
  # Globals
  #
  $hero: $('.m-hero')
  cats: []

  #
  # Build Cats index
  #
  buildCats: ->
    _.each(window.cats, (cat, key) ->
      console.log key % 1
      console.log key % 2
      console.log key % 3
    )

  #
  # Colors
  #
  colors: ->
    if @$hero.length > 0
      console.log "test"

  #
  # Init
  #
  init: ->
    @buildCats()
    @colors()

#
# Export
#
module.exports = Hero
