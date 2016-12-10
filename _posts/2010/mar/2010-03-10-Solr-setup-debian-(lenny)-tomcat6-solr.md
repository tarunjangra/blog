---
layout: post
title: "Solr setup debian (lenny) + tomcat6 + solr"
date: 2011-06-10
description: |
  Solr is an indexing engine which runs on the top of JVM. Here we are talking about solr setup on debian lenny distribution.
tags:
- SOLR
- Indexing Engine
- Debian
- tomcat6
- JDK
---

I am working on a task to set solr enterprise search for elgg. I am as digging as getting surprised with this amazing 
search utility. First i am going to explain how to install solr with tomcat6.x. 

###Requirements:

1. JDK, JRE (OpenJDK, SunJDK)
2. Tomcat6.x
3. Latest solr

<!--more-->

###Installation JDK,JRE:

Well i used to setup openjdk and openjre on my lenny server. It is quite easy to use debian package manager. You can install 
is using

{% highlight bash %}
apt-get install openjdk-6-jre, openjdk-6-jdk
{% endhighlight %}

And i was installed with all jdk and jre environment. You may need to setup JAVA_HOME environment variable if you do not wish 
to install JDK at default location. You can do this in “.profile” located under your home or “/etc/profile” to make it enable for 
all available users.

###Download tomcate6.x

I downloaded tomcat binary “apache tomcat 6.0.24” and untar it at “/usr/local/”. You can choose any of your selected location. 
So my location of all tomcat binaries was “/usr/local/tomcat”. That’s it, you have done with tomcat installation. 
You can start tomcat as:

{% highlight bash %}
cd /usr/local/tomcat/bin/
./startup.sh
{% endhighlight %}

Now put http://localhost:8080 in your browser. You will see the response of tomcat server. Now next step is to install solr 
as a tomcat application. It needs some configurations.

###Installation & configuration of Solr

Download apache solr and unzip it at any accessible location. Now create some directories under tomcat as

{% highlight bash %}
mkdir /usr/local/tomcat/data/solr/elgg/conf -p
mkdir /usr/local/tomcat/data/solr/elgg/data -p
{% endhighlight %}

Now we need to copy “apache-solr-1.4.0.war” file for tomcat deployment. Go to the directory where you unzip the solr file. 
i found that file as “/apache-solr-1.4.0/dist/apache-solr-1.4.0.war”.

{% highlight bash %}
cp apache-solr-1.4.0/dist/apache-solr-1.4.0.war /usr/local/tomcat/data/solr
{% endhighlight %}

Now, in /usr/local/tomcat/conf/Catalina/localhost we need to create and save a files which will be read the next time you 
start Tomcat, and properly deploy Solr. Use a text editor of your choice and create a files name “solrelgg.xml” in the 
/usr/local/tomcat/conf//Catalina/localhost subdirectory. Put the contents as follow

{% highlight xml %}
<Context docBase=”/usr/local/tomcat/data/solr/apache-solr-1.4.0.war” debug=”0″ crossContext=”true”>
<Environment name=”solr/home” type=”java.lang.String” value=”/usr/local/tomcat/data/solr/elgg” override=”true” />
</Context>
{% endhighlight %}

Now go to “apache-solr-1.4.0/example/solr/conf” and copy all default configuration files in to our configured configuration
 directory under tomcat.

{% highlight bash %}
cd apache-solr-1.4.0/example/solr/conf
cp * -R /usr/local/tomcat/data/solr/elgg/conf
cd /usr/local/tomcat/data/solr/elgg/conf
{% endhighlight %}

Now edit “solrconfig.xml” and find “solr.data.dir” parameter. Change it’s value to new data directory. I gave relative path like “
../data” So now it was pointing to new data directory “/usr/local/tomcat/data/solr/elgg/data”. Well this edit is an optional 
step. you can skip this. In that case, data directory will be created at default location according to the default value of 
“solr.data.dir”.
Now start tomcat server using “/usr/local/tomcat/bin/startup.sh” and than browse as:

http://localhost:8080/solrelgg

It should show you “Welcome to Solr!” message with “Solr Admin” link.
I hope, it would work for you. Now elgg integration is just the matter of pushing new entities at create entity hooks and all 
other crud operations.