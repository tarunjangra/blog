---
layout: post
title: "Parse operating system commands from ruby."
date: 2008-05-26
description: |
  Ruby is a programming language built for developers. It is Developer friendly so loved by developer community. Here i've added
  some code helps you to parse operating system commands.
tags:
- Ruby
- Parse
- OS
---

If you want to execute operating system level commands from ruby the solution is below. it’s quite easy and interesting. What 
would i say about the beauty of ruby here, Just thanks to ruby creators.

<!--more-->

{% highlight ruby %}
irb(main):001:0> system('ls -l')
total 2240
drwxr-xr-x 15 tarun tarun   24576 2008-05-21 01:33 git-1.5.5.1
-rw-r--r--  1 tarun tarun 2002900 2008-04-21 03:47 git-1.5.5.1.tar.gz-rw-r--r--  1 tarun tarun  252308 2008-04-21 04:05 git-manpages-1.5.5.1.tar.gz
drwxr-xr-x  3 tarun tarun    4096 2008-05-21 09:42 ruby
=>; true
irb(main):002:0>
{% endhighlight %}