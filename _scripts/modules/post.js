//
//
// Post
//
//
var Post = {

  //
  // Globals
  //
  $article: $('.s-post .m-article'),

  //
  // Get reading time
  //
  reading: function() {
    var ctx;
    ctx = this;
    if (this.$article.length > 0) {
      ctx.$article.readingTime({
        readingTimeTarget: ctx.$article.find('.m-article-reading'),
        wordsPerMinute: 250,
        round: true,
        lang: 'en',
        success: null,
        error: null
      });
      return setTimeout(function() {
        return $('.m-hero-reading span').text(ctx.$article.find('.m-article-reading').text());
      }, 0);
    }
  },
  init: function() {
    return this.reading();
  }
};

//
// Export
//
export default Post;
