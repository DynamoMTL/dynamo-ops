# Use the app.rb file to load Ruby code, modify or extend the models, or
# do whatever else you fancy when the theme is loaded.

module Nesta

  class App
    # Uncomment the Rack::Static line below if your theme has assets
    # (i.e images or JavaScript).
    #
    # Put your assets in themes/matz/public/matz.
    #
    use Rack::Static, urls: ["/matz"], root: "themes/matz/public"

    helpers do
      def matz_all_articles
        Nesta::Page.find_articles
      end

      def matz_article_listing(articles)
        haml(:listing, layout: false, locals: { pages: articles })
      end

      def matz_page_classes(page, default_class)
        default_class ||= ''
        page_class = page.date ? default_class + ' page-single' : default_class
        flags = ['tutorial', 'no-title', 'col-2', 'col-3', 'col-4']
        flags.each do |flag|
          if page.flagged_as?(flag)
            page_class += /(col)/.match(flag) ? ' col ' + flag : ' ' + flag
          end
        end
        page_class
      end

      def matz_format_date(date)
        date.strftime("%A")
      end
    end
  end

    # Add new routes here.
end
