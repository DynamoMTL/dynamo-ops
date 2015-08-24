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

**Posts**

All the posts reside in the folder called `_posts` on the root of the app. You will also see that the content is organized in subfolders that each bear the same same as the category in which the article resides. This is optional but should be respected if possible.

Jekyll requires that the posts be named in the following format `YEAR-MONTH-DAY-title.md`. So for example, `2011-12-31-new-years-eve-is-awesome.md`. This however does not mean that the URL will reflect that but it really needs to be called as such to be picked up buy Jekyll as being a post and to be able to display the date.

See: http://jekyllrb.com/docs/posts/

Each post needs metadata up at the very of the document. Here are the ones that we need:

```
---
layout: post
title: The title of the article (will be capitalized on the site)
date: YYYY-MM-DD (this will override the date in the name of the file, it is recommanded to change the date here when updating the content and keep the filename date as the creation date)
published: true (or false)
category: name-of-the-category (should have only one)
tags: subject-a subject-b subject-c (list separated by spaces)
order: 1 (the order in which you want to see the post appear from 1 to n, also need to readjust the other posts)
intro: true (false, this is what is gonna be displayed at the top of a category page, but not as a post)
---
```

See: http://jekyllrb.com/docs/frontmatter/


**Attachments**

All the attachments that you want to include in a post (images, pdf, etc.) need to be added in the `uploads` folder. They can be added to a subfolder in there as well, for sake of structure.

We added a filter to help you reference those files easily. It can be used like this: `![My helpful screenshot]({{ "flag.png" | uploads_url }})`, where `uploads_url` will build the path to the assets.


**Links**

If you want to link to an outside page, you can do so using this helper: `[Name of Link](http://example.com)`. You can append `{:target="_blank"}` to this helper to get the link to open in a new tab/window like so : `[Name of Link](http://example.com){:target="_blank"}`.

If you want to link to a blog post on the site, you need to use a liquid helper as such `[This is an example of a link to another blog post]({% post_url at-the-office/2015-01-01-coffee %})`, where `at-the-office` is a sub-folder (if necessary) and `2015-01-01-coffee` the full name of the post.


**Excerpts**

To specifiy which parts of the content is gonna populate the excerpts (listing pages, search pages, etc.), you need to add the following commentary in the post's content:

```
Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates illum, reiciendis doloribus voluptas
consequatur cupiditate quas, vero eligendi error facere ipsam aliquam repellat et ipsum voluptatibus sequi! In, magni, aperiam!

<!--more-->

Voluptates illum, reiciendis doloribus voluptas consequatur cupiditate quas, vero eligendi error facere
ipsam aliquam repellat et ipsum voluptatibus sequi! In, magni, aperiam!
```

The `<!--more-->` comment will determine where the excerpt ends.


**Prose**

To use Prose to edit your files, just go here and authenticate: http://prose.io/#DynamoMTL/dynamo-ops
