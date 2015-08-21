#
#
# Post
#
#
Post =

  #
  # Globals
  #
  $article: $('.s-post .m-article')

  #
  # Get reading time
  #
  reading: ->
    ctx = @
    if @$article.length > 0
      ctx.$article.readingTime(
        readingTimeTarget: ctx.$article.find('.m-article-reading')
        wordsPerMinute: 250
        round: true
        lang: 'en'
        success: null
        error: null
      )
      setTimeout(->
        $('.m-hero-reading span').text(ctx.$article.find('.m-article-reading').text())
      , 0)

  init: ->
    @reading()

#
# Export
#
module.exports = Post
