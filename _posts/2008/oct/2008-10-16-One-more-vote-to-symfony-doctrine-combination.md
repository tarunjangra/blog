---
layout: post
title: "One more vote to symfony + doctrine combination."
date: 2008-10-16
description: |
  This is my one more vote to consider symfony php framework. And i'm become pretty much confident to consider symfony in my next
  project.
tags:
- Doctrine
- Symfony
- PHP
---

Yesterday i had completed with “askeet” web application on my local server successfully. It was really great experience to work 
with symfony. Well personally i have experience of ruby on rails, CakePHP, CodeIgniter and now symfony also. Exploring around 
symfony, I came to know about one more database layer “Doctrine”. 

<!--more-->

I found excellent comments about doctrine database layer 
in symfony. And more over for the future release, Doctrine will be bundled with symfony as a default database layer. I thought, 
it’s better to take a short try and it really amazed me. I just read about “Behaviours” one of the key feature of “Doctrine” 
and i fell in love with this. Curious about other features to give try. Anyway, here’s a small tutorial to install doctrine 1.0.3 
with symfony 1.1.

Browse the document root of your project and type following commands in you bash shell:

{% highlight bash %}
$ svn co http://svn.symfony-project.com/plugins/sfDoctrinePlugin/branches/1.1 plugins/sfDoctrinePlugin
{% endhighlight %}
It will fetch all required libraries of latest release of “Doctrine” and the version i got today is “Doctrine 1.0.3″. Yes, 
that’s what i said it will fetch all libraries of current release of “Doctrine”.  Thanks to “Jonathan H. Wage” who is maintaining 
svn branches with current release of “Doctrine” and much more.