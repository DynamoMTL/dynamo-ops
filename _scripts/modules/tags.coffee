#
#
# Tags
#
#
Tags =

  #
  # Globals
  #
  $parents: $('.m-tags-parent')

  #
  # Generate the tags from strings
  #
  generate: ->
    @$parents.each((i) ->
      tmp = []
      $this = $(@)
      $target = $this.find(".m-tags-target")
      $tags = $this.find('[data-tags]')
      $tags.each((i) ->
        $this = $(@)
        tags = $this.data("tags").split(",")
        tmp = _.union(tmp, tags)
      )
      console.log "$target", $target
      _.each(tmp, (tag) ->
        el = "<li>#{tag}</li>"
        $target.append(el)
      )
    )

#
# Export
#
module.exports = Tags
