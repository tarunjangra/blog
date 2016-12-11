---
layout: post
title: "Simple steps to setup symfony and svn"
date: 2009-01-01
description: |
  Symfony is really great PHP framework. It follows strict Model View Controller structure. Here are some installation steps which
  will help you to install symfony.
tags:
- UNIX
- Linux
- Symfony
- PHP
- MVC
---

I setup my ubuntu box with svn server and symfony. Here i want to share simple steps to configure symfony and svn server. 
I will cover the svn access from file system. I am considering you had installed SVN server. If not than follow these instructions. 
Now let’s install symfony. I will follow the pear installation.

<!--more-->

{% highlight bash %}
pear channel-discover pear.symfony-project.com
pear install symfony/symfony
{% endhighlight %}


So it will install symfony framework for you. Now we will configure svn with symfony for the access from file system. 

1. Login as a root.
2. Create new user “svn” with some specific home directory say /home/svn.
3. Create your project directory in your svn user. say /home/svn/new_project.
4. Setup repository structure with “svnadmin create /home/svn/new_project”.
5. Now browse your svn home with “cd /home/svn”
6. Let’s set some permissions with “chown -R www-data new_project”.
7. Then “chgrp -R subversion new_project”
8. And “chmod -R g+rws new_project”
9. Now suppose your project’s home directory is “/home/new_project/public_html” and user of your project is “new_project”. Now we will give access of svn directory to “new_project” user by editing /etc/group. assign svn to new_project group.
10. Now login to the user “new_project” and make sure you have both groups with “id -a”. Now browse your projects directory. In my case it is “/home/new_project/public_html”
11. Set an environment variable with “export SVN_DIR=/home/svn/new_project”
12. Now Create directory structure of your repository for your project. To do so give “svn mkdir -m “initial structure” file:///$SVN_DIR/trunk file:///$SVN_DIR/tags file:///$SVN_DIR/branches”
13. Now make sure you are in /home/new_project/public_html and give “symfony generate:project new_project” where “new_project” is the name of your project.
14. Now give these two commands to clear cache and log “rm -rf cache/* , rm -rf log/*”.
15. Now Import with “svn import -m “initial import” . file:///$SVN_DIR/trunk”.
16. Now go to “/home/new_project” and move your project directory to public_html.original with “mv public_html public_html.original”.
17. Give “svn co file:///$SVN_DIR/trunk public_html” command to create the working version of your project.
18. Now browse your project directory with “cd public_html” and give “svn propedit svn:ignore cache”. It will open your default editor. put “*” and save that. similarly for log directory with “svn propedit svn:ignore log”, put “*” and save it. It will put your “cache” and “log” directory in the ignore list of svn server.
19. Now give [ svn commit -m “added cache/ and log/ content in the ignore list” ] command to commit the ignorance list.

That’s all. It will setup your symfony svn controlled project. I hope it will help some body and save some time.