---
layout: post
title: Behind the scenes
comments: true
---

This is my first github blog and so far things are very fine. I have previously used Blogger, Wordpress, Tumblr. But currently, I use something known as [Jekyll](http://jekyllrb.com/) ("Tranform your plaintexts into static websites and blogs") to run my blog. I'm no expert in programmming, and still was able to run Jekyll and startup a Jekyll blog with ease and I totally recommend it to anyone who is looking for some lightweight blogging platform.

Some pointers about the current system:

- Posts can be prepared using markdown. I use Emacs editor and use `markdown-mode`, `markdown-enable-math` and `flyspell-mode` (spell checking) for preparing posts. I use [kramdown](http://kramdown.gettalong.org/) syntax (which is a superset of the normal Markdown) which has support for $\LaTeX$--something that Tumblr markdown parser doesn't have.
-  The equations are rendered using [MathJax](http://www.mathjax.org/) which is superior to image-based equations that is used in Wordpress.
- [Disqus](https://disqus.com/) platform is used for comments. The only downfall of this system is it's [inability to support math in comments](http://stackoverflow.com/questions/18146068/is-it-possible-to-use-mathjax-in-disqus/18158057#18158057).
- The command `jekyll serve` can be used to create a local version of my blog (at `localhost:4000`). This is very useful while making changes to my blog. I can preview it locally before I mess things up at the Github repository. But if you are not connected to the internet, then MathJax and Gist codes will, of course, not be displayed. 
