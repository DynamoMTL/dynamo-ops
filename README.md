# Dynamo OPS

A simple site to host Ops content.

### Running The Site

The site can be fired up locally (after bundling ALL THE GEMS) using:

`bundle exec mr-sparkle`

This will setup a development site on `localhost:8080`.

### Frontend

Nesta plays nicely with the concept of themes. It allows you to rapidly
create or edit themes, and use them as the default one using the config file.
Create a folder with the name in the theme directory and then within include:

```
-- views : details of the views that are added to the project, check out the current theme
-- public
  |-- folder_name : images/javascripts
-- app.rb : helper methods, ruby code for the application
```

It is often common to have a components directory under public where bower
and NPM is used to grab needed assets.

### Backend

Nesta really is just some sugar on top of Sinatra. It is made to be run like
a static site generator but utilizing Rack for the needed application logic.

* Documentation can be found [here][1]

There is no actual database, everything is read from the `content/pages` directory
and turned into valid HTML using the [Tilt templating engine][2]. This means
that anything written in HAML, Markdown, ERB, Coffeescript, [Creole][3] is
quickly and efficiently turned into valid HTML.

Url's are generated from the content in the `content/pages` folder meaning that
a url of `site.com/stuff.com` will be generated for `content/pages/stuff.md`.
Nesting in this directory is completely OK and will be reflected in the URL.


[1]: http://nestacms.com/docs
[2]: https://github.com/rtomayko/tilt
[3]: https://en.wikipedia.org/wiki/Creole_(markup)
