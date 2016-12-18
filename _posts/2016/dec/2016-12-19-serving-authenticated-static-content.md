---
layout: post
title: "Serving Authenticated Static Content was pretty expensive before today"
date: 2016-12-19
description: |
  I've never used this feature of httpd servers like apache, nginx which allows me to serve authenticated static content to the 
  end user without so much dependency on my application language.
tags:
- nginx
- apache
- httpd
- module
---

It has always been the pain when we need to server authenticated static content. Because we are bound with programming framework 
to handle the authentication job. And once authenticated, 
<!--more-->
you have to read the file from the Disk through your programming to 
stream to the end user with correct mime type. This was the only solution for me before today.

![Nginx x-accel module](http://i.imgur.com/ABtCr5z.jpg)

While working on some project, i’ve found XSendfile and X-Accel. X-accel allows for internal redirection to a location 
determined by a header returned from a backend.

This allows you to handle authentication, logging or whatever else you please in your backend and then have NGINX handle 
serving the contents from redirected location to the end user, thus freeing up the backend to handle other requests. This 
feature is commonly known as X-Sendfile.

NGINX also has this feature, but implemented a little bit differently. In NGINX this feature is called X-Accel-Redirect.

There are two main differences:

1. The header must contain a URI.
2. The location should be defined as internal; to prevent the client from going directly to the URI.

We have been missing this feature in our elgg development. Now we will definitely use this module to get the better
 performance while service static content to the end user. No more stream reading from disk and serve further.