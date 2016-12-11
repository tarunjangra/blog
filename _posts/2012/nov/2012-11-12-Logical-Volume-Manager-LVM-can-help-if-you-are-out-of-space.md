---
layout: post
title: "Logical Volume Manager (LVM) can help if you are out of space"
date: 2012-11-12
description: |
  LVM is a great tool. Especially when your *nix machine going out of available space. A solution to put new harddisk and allocate as
  per requirement.
tags:
- UNIX
- Linux
- LVM
- Partitioning
---


Today i was wondering when i found, my ubuntu server’s home partition is about to finish. It was having lots of projects we are 
working on. Replacing the old hardisk with the new of bigger size is one solution but it is so much time consuming. Ohhhh it is so scary.
 Copy every thing from old to new hard drive. Install every single application and library my scripts needed. 
 
<!--more-->

![Logical Volume Manager]({{ site.url }}/images/assets/LVM_original_description.png)

Obviously that is time consuming process. But thanks to Logical Volume Manager(LVM). Fortunately i have used LVM to configure my old hard drive 
and that really helped me to extend my “home” drive in minutes without copying and all boring stuff as i explained above. My old 
hard disk scheme was:

{% highlight bash %}
100MB /boot
73GB PV (Physical Volume )
3 GB /myDB ( my database directory)
45GB /home (All my projects are located in home)
{% endhighlight %}

So i was going out of space. What i did, I purchased new 1TB WD sata hard drive. And configure that on secondary sata port. 
My ubuntu box detect the new hard drive. I make it sure by following command.

{% highlight bash %}
fdisk -l       
# i got my both partitions as /dev/sda and dev/sdb (new one).
vgdisplay    
# I got the name of the volume group to be used.
vgextend  /dev/sdb   
# this command put my new hard drive in the existing volume group.
vgdisplay   
# To make it sure if this new hard drive is actually added to the new group.
lvextend -L 500G /dev/volume-group-name/drive-name  
# Drive name was assigned to my "home" dir.
resize2fs /dev/volume-group-name/drive-name  
# This took about 10 mins to extend my home with more 500G.
{% endhighlight %}

So this is how i extend all space. I noticed while extending i was able to access all projects from that extending drive. 
There was no crash or no restart (usually forced by windows for such tasks :) ). It means process is so efficient, you can use
your disk even while making this arrangement to increase more space. Anyway, That how i get to work everything within 10 mins. 
It was really amazing experience.