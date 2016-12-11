---
layout: post
title: "Global setup of doctrine plugin for symfony1.1."
date: 2008-10-17
description: |
  Doctrine is an ORM which allows you to connect with different database. Here we will integrate symfony1.1 with doctrine latest
  avaialble version.
tags:
- Doctrine
- Symfony
- PHP
---

Here is a small tutorial to make available your doctrine plugin for all of your projects residing on the shared server.

<!--more-->

I have ubuntu 8.04 LTS box. Default symfony installation is located under “/usr/share/php/symfony/”. Locate whatever your 
installation directory of symfony and type following commands:

{% highlight bash %}
$ cd /usr/share/php/symfony/
$ svn co http://svn.symfony-project.com/plugins/sfDoctrinePlugin/branches/1.1 plugins/sfDoctrinePlugin
$ cd plugins/sfDoctrinePlugin/config
$ vi autoload.yml
{% endhighlight %}

do following modifications

{% highlight php %}
#path:       <?php echo realpath(dirname(__FILE__) . '/../lib') . "\n"; ?>
path:       %SF_SYMFONY_LIB_DIR%/plugins/sfDoctrinePlugin/lib
{% endhighlight %}

Then save that file and create new file “config.php” with the following script
{% highlight php %}
set_include_path(get_include_path().PATH_SEPARATOR.dirname(__FILE__).'/../lib/'.PATH_SEPARATOR.sfConfig::get('sf_root_dir'));
{% endhighlight %}

Now doctrine plugin will be available for all of your projects located on same shared server.