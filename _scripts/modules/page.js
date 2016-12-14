//
//
// Page
//
//
import $ from 'jquery'

export default {

  //
  // Globals
  //
  $body: $('body'),

  //
  // Generate the tags from strings
  //
  $doc: $(document),
  transition () {
    let ctx = this
    setTimeout(function() {
      return ctx.$body.addClass('is-loaded')
    }, 500)
  },
  init () {
    return this.transition()
  }
}
