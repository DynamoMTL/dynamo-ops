//
//
// Main
//
//

//
// Requires
//
require('../bower_components/lodash/lodash');
require('../bower_components/reading-time/src/readingTime');

//
// Imports
//
import Page from './modules/page'
import Tags from './modules/tags'
import Hero from './modules/hero'
import Post from './modules/post'

//
// jQuery
//
$(function() {
  Page.init();
  Tags.generate();
  Hero.init();
  Post.init();
});
