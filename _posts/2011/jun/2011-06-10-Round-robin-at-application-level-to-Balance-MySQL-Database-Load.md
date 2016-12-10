---
layout: post
title: "Round-robin at application level to Balance MySQL Database Load"
date: 2011-06-10
description: |
  My First Post on my new blog. where i am just introducing my self and 
  looking forward to share my ideas and working experiences.
tags:
- RDBMD
- MySQL
- Round robin
- AWS
- RDS
---


Round robin technique facilitates you to distribute your read queries on number of available resources even if all servers are located
at different locations. Huge traffic sites like Facebook has to has such techniques working at the background to serve as fast as
 possible.<!--more--> I would like to discuss one of my personal implementation experience for such a large potential social networking site.
  Cloud computing is really help full but it also needs logical approach at programming level.

![MySQL Round-Robin]({{ site.url }}/images/assets/mysql-57-clustering-the-developer-perspective-60-638.jpg)

###Approach 1: Six servers architecture on amazon cloud.

WOW! I had implemented 1 load balancer, 1 mysql master db, 1 mysql slave db and 3 application server. Such an architecture  
can handle huge traffic. Since there is a separate application server layer where we can add more application servers anytime 
we need. So user requests get balanced on 3 application servers and they get response. But in my application i had one more 
problem. When user click on single link it executes 100+ SQLs because there is a framework overhead and some intentional queries.
Hmmmm, So MySql load is never balanced with this technique and it has to be. Because 1 request is triggering 100+ SQLs.
So i drill down to find out the solution and decided to separate sql reads and writes. Ok so with this, i get an opportunity 
to divide separate Writes of MySQL db and initiated one mysql slave server.

###Does this really get me at the end of performance level?

No. Because we use read queires more frequently then write. Son in 100+ SQLs i have lesser database writes. So My write server 
is still have idle resources.

###Here is where Round Robin comes in.

If i could be able to develop a logic which distributes my 100+ SQLs to any number of replicated instances available. 
That could really work for me. Say i have 5 read servers for 100+ SQL. Than i can distribute around 20 SQL per server per request. 
And as we increase number of read server. System can adjust it self to distribute (SQL queries) / (Number of servers) (Qn / Sn). 
In this way, all of my server will work for every SQL requested from the system. And I could get maximum performance from servers.
 Because there is no use if we have 1000 Servers and 1 server is responding for 1 complete request. Because in this case 999 
 servers are free and which is wastage of Money. So i implemented that in My PHP application and that really makes sense to be 
 available on Cloud to use maximum resources.
