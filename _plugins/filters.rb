module Jekyll

  # Uploads folder filter
  module UploadsFilter
    def uploads_url(input)
      "#{Jekyll.configuration({})['baseurl']}/uploads/#{input}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::UploadsFilter)
