module Jekyll

  # Uploads folder filter
  module UploadsFilter
    def uploads_url(input)
      "#{Jekyll.configuration({})['baseurl']}/uploads/#{input}"
    end
  end

  # Shuffle array
  module ShuffleArray
    def shuffle(input)
      input.shuffle
    end
  end

  # Capitalize all words of the input
  module CapitalizeAll
    def capitalize_all(words)
      return words.split(' ').map(&:capitalize).join(' ')
    end
  end
end

Liquid::Template.register_filter(Jekyll::CapitalizeAll)
Liquid::Template.register_filter(Jekyll::UploadsFilter)
Liquid::Template.register_filter(Jekyll::ShuffleArray)
