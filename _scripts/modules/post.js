//
//
// Post
//
//
import $ from 'jquery'
import readingTime from 'reading-time'

const Post = {

  //
  // Globals
  //
  $article: $('.s-post .m-article'),

  //
  // Get reading time
  //
  reading: function() {
    if (this.$article.length < 1) return
    let time = readingTime(this.$article.html())
                .text
                .split('read')
    return setTimeout(function() {
      $('.m-hero-reading span').text(time[0])
    }, 0)
  },
  init: function() {
    return this.reading()
  }
}

//
// Export
//
export default Post
