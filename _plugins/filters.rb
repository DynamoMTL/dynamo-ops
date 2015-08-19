module Jekyll

  # Uploads folder filter
  module UploadsFilter
    def uploads_url(input)
      "#{Jekyll.configuration({})['baseurl']}/uploads/#{input}"
    end
  end

  # Category intro remove from array
  module IntroFilter
    def without_intro(input)
      debugger
      input.intro == blank || input.intro == false
      # input.keep_if { |post| post.intro == blank || post.intro == false }
    end
  end
end

Liquid::Template.register_filter(Jekyll::UploadsFilter)
Liquid::Template.register_filter(Jekyll::IntroFilter)
