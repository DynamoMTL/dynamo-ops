//
//
// Page
//
//
var Page = {

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
    console.log("Page.init()");
    return this.transition();
  }
};

//
// Export
//
export default Page;
