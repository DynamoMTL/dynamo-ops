//
//
// Post
//
//
import $ from 'jquery'

const Post = {

  //
  // Globals
  //
  $article: $('.s-post .m-article'),

  buildNav () {
    let $headings = this.$article.find('.m-article-content h2')
    let $nav = this.$article.find('.m-article-nav-list')
    if ($headings.length < 1) return

    $headings.each(function () {
      let $heading = $(this)
      $heading.wrap(`<a href="#${$heading.attr('id')}"></a>`)
    })

    if ($headings.length < 3) return

    this.$article.addClass('has-nav')
    $headings.each(function () {
      let $heading = $(this)
      let template = `
        <li>
          <a href="#${$heading.attr('id')}">
            ${$heading.text()}
          </a>
        </li>
      `
      $nav.append(template)
    })
  },

  init () {
    this.buildNav()
  }
}

//
// Export
//
export default Post
