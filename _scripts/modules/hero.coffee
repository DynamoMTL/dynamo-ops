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
  cats: {}
  theme: ["pink", "yellow", "blue", "green", "gray"]

  #
  # Build Cats index
  #
  buildCats: ->
    ctx = @
    _.each(window.cats, (cat, key) ->
      factor = 5
      div = Math.floor(key / factor)
      pos = key - (div * factor)
      ctx.cats[cat[0]] =
        color: ctx.theme[pos]
    )

  #
  # Colors
  #
  colors: ->
    if @$hero.length > 0
      ctx = @
      catName = ctx.$hero.data("cat-name")
      ctx.$hero.addClass("m-hero--#{ctx.cats[catName].color}")

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
