//
//
// Main
//
//

//
// Requires
//
require("../bower_components/lodash/lodash");
require("../bower_components/reading-time/src/readingTime");

//
// jQuery
//
$(function() {
  var Page = require('./modules/page'),
      Tags = require('./modules/tags'),
      Hero = require('./modules/hero'),
      Post = require('./modules/post');
  Page.init();
  Tags.generate();
  Hero.init();
  Post.init();
  return
});
