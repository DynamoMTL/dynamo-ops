# Plugin to add environment variables to the `site` object in Liquid templates

module Jekyll

  class EnvironmentVariablesGenerator < Generator

    def generate(site)
      site.config['url'] = ENV['URL'] || 'http://localhost'
      site.config['env'] = ENV['ENV'] || 'development'
    end

  end

end
