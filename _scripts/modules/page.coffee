#
#
# Page
#
#
Page =

  #
  # Globals
  #
  $body: $('body')
  $doc: $(document)

  #
  # Generate the tags from strings
  #
  transition: ->
    ctx = @
    setTimeout(->
      ctx.$body.addClass('is-loaded')
    , 500)

  #
  # Init
  #
  init: ->
    @transition()

#
# Export
#
module.exports = Page
