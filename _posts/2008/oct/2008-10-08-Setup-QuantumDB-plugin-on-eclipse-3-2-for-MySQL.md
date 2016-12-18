---
layout: post
title: "Setup “QuantumDB” plugin on eclipse 3.2 for MySQL"
date: 2008-10-08
description: |
  QuntumDB is an another candidate in the queue of database browser plugin for one of the most popular Integrated Development 
  Environment Eclipse.
tags:
- Eclipse
- MySQL
- Browser
---

QuantumDb is one of the most popular sql browser. It supports different flavor of databases listed below:

<!--more-->

* Adabas
* DB2
* DB2 on AS400
* HSQLDB
* Informix
* MySQL
* Oracle
* Pointbase
* PostgreSQL
* Sybase

###Requirement:

QuantumDB depends upon "Graphical Edition Framework(GEF)" plugin. You can see all installation instruction to install 
[GEF](http://wiki.eclipse.org/GEF/Developer_FAQ#How_do_I_Install_GEF.3F)

###Installation:

Installation is very simple. just go to “Help >> Software Updates >> Find & install” and put new remote site. URL is 
"http://quantum.sourceforge.net/update-site/". After download and installation, eclipse will ask for restart and here you done.

###MySQL connection:

By default, QuantumDB fresh installation does not include connection library of mysql. You will have to download mysql connector 
from "https://dev.mysql.com/downloads/connector/j/3.1.html". Download zipped file and extract it some where. Now find out mysql 
connector file “mysql-connector-java-5.1.6-bin.jar” and place it some where at your secure location. Now go to eclipse and add 
new bookmark. Now click on “Add Driver”. It will open the new dialog box and than add driver’s .jar file. Now click on “Browse” 
button to select the class name. Select “com.mysql.jdbc.Driver” for class name. that’s it, next it will ask you expected 
information for your mysql hostname, username etc.