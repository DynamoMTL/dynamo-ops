(Temp)

### Running the server

To run the project after checkout:
- `bundle install`
- `npm install`
- `bower install`
- `bundle exec gulp serve`

To run an already checked out project:
- `bundle exec gulp serve`

You are welcome.

### Content creation

** Posts **

Jekyll requires that the posts be named in the following format `YEAR-MONTH-DAY-title.md`. So for example, `2011-12-31-new-years-eve-is-awesome.md`. This however does not mean that the URL will reflect that but it really needs to be called as such to be picked up buy Jekyll as being a post and to be able to display the date.

See: http://jekyllrb.com/docs/posts/

Each post needs metadata up at the very of the document. Here are the ones that we need:

```
---
layout: post
title: The title of the article (will be capitalized on the site)
published: true (or false)
category: name-of-the-category (should have only one)
tags: subject-a subject-b subject-c (list separated by spaces)
order: 1 (the order in which you want to see the post appear from 1 to n, also need to readjust the other posts)
intro: true (false, this is what is gonna be displayed at the top of a category page, but not as a post)
---
```

See: http://jekyllrb.com/docs/frontmatter/


** Attachments **

All the attachments that you want to include in a post (images, pdf, etc.) need to be added in the `uploads` folder. They can be added to a subfolder in there as well, for sake of structure.

We added a filter to help you reference those files easily. It can be used like this: `![My helpful screenshot]({{ "flag.png" | uploads_url }})`, where `uploads_url` will build the path to the assets.
