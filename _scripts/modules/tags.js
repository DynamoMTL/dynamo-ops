//
//
// Tags
//
//
var Tags = {

  //
  // Globals
  //
  $parents: $('.m-tags-parent'),

  //
  // Generate the tags from strings
  //
  generate: function() {
    return this.$parents.each(function(i) {
      var $tags, $target, $this, tmp;
      tmp = [];
      $this = $(this);
      $target = $this.find(".m-tags-target");
      $tags = $this.find('[data-tags]');
      $tags.each(function(i) {
        var tags;
        $this = $(this);
        tags = $this.data("tags").split(",");
        return tmp = _.union(tmp, tags);
      });
      return _.each(tmp, function(tag) {
        var el;
        el = "<li>" + tag + "</li>";
        return $target.append(el);
      });
    });
  }
};

//
// Export
//
export default Tags;
