//
//
// Main
//
//

//
// Requires
//

//
// Imports
//
import $ from 'jquery'

import Page from './modules/page'
import Tags from './modules/tags'
import Hero from './modules/hero'
import Post from './modules/post'

//
// jQuery
//
$(function() {
  Page.init()
  Tags.generate()
  Hero.init()
  Post.init()
});
