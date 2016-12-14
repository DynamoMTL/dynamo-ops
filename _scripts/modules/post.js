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
  reading () {
    if (this.$article.length < 1) return
    let time = readingTime(this.$article.html())
                .text
                .split('read')
    setTimeout(function() {
      $('.m-hero-reading span').text(time[0])
    }, 0)
  },
  init () {
    return this.reading()
  }
}

//
// Export
//
export default Post
