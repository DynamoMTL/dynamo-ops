module Jekyll

  class EnvironmentVariablesGenerator < Generator

    def generate(site)
      site.config['domain'] = ENV['JEKYLL_DOMAIN'] || 'http://localhost:3000'
      site.config['env'] = ENV['JEKYLL_ENV'] || 'development'
    end

  end

end
