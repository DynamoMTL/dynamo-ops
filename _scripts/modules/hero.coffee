#
#
# Hero
#
#
Hero =

  #
  # Globals
  #
  $hero: $('.m-hero--colors')

  #
  # Random colors
  #
  colorsRandom: ->
    if @$hero.length > 0
      color = _.shuffle(['pink', 'yellow', 'blue', 'green', 'gray'])[0]
      @$hero.addClass("m-hero--#{color}")

#
# Export
#
module.exports = Hero
