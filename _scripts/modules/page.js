//
//
// Page
//
//
var Page;

Page = {

  //
  // Globals
  //
  $body: $('body'),

  //
  // Generate the tags from strings
  //
  $doc: $(document),
  transition: function() {
    var ctx;
    ctx = this;
    return setTimeout(function() {
      return ctx.$body.addClass('is-loaded');
    }, 500);
  },
  init: function() {
    return this.transition();
  }
};

//
// Export
//
module.exports = Page;
