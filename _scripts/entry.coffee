#
#
# Main
#
#

#
# Requires
#
require("../bower_components/lodash/lodash")

#
# jQuery
#
$ ->
  console.log "jQuery is ready"

  #
  # Tags
  #
  Tags = require('./modules/tags')
  Tags.generate()

  #
  # Hero
  #
  # Hero = require('./modules/hero')
  # Hero.colorsRandom()
