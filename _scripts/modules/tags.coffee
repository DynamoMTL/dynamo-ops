#
#
# Tags
#
#
Tags =

  #
  # Globals
  #
  $cards: $('.m-cards-el')

  #
  # Generate the tags from strings
  #
  generate: ->
    @$cards.each((i) ->
      tmp = []
      $this = $(@)
      $target = $this.find(".m-cards-el-tags")
      $tags = $this.find('[data-tags]')
      $tags.each((i) ->
        $this = $(@)
        tags = $this.data("tags").split(",")
        tmp = _.union(tmp, tags)
      )
      _.each(tmp, (tag) ->
        el = "<li>#{tag}</li>"
        $target.append(el)
      )
    )

#
# Export
#
module.exports = Tags
