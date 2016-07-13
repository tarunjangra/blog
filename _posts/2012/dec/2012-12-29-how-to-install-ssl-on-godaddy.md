---
layout: post
title: "How to install go-daddy ssl certificate on amazon load balancer"
date: 2012-12-29
description: |
  Installation of GoDaddy.com SSL certification on amazon elastic loadbalancer.
tags:
- GoDaddy
- SSL
- ELB
- AWS
---

I was struggling around to install SSL Certificate on ELB. And finally i’ve made that. Following are the steps you need to follow.

##Requirements & Prerequisites:

1. Linux having openssl and apache installed.
2. Open shell terminal on your Linux Box.

{% highlight bash %}
openssl genrsa -des3 -out private.key 1024
openssl req -new -key private.key -out www.your-web-site.com.csr
{% endhighlight %}

You will be prompt to provide some basic information. Make sure you have added “Common Name”; a fully qualified domain name. like “www.xyz.com”

1. Open to www.godaddy.com and go to ssl management control panel
2. Select your Certificate. And click on Re-Key button.
3. Copy content of “www.your-web-site.com.csr” and paste the content in “CSR” field. And press Re-Key.
4. It will prompt you to download the keys. Available options to download are Apache, Nginx and Other. By the way, i used “Other” to download my keys to be used on ELB.
5. Now unzip the downloaded file. It should have two *.crt files.

##Now back to your terminal.

{% highlight bash %}
openssl rsa -in private.key -out private.pem
{% endhighlight %}

Now you will have following files in your current location.

1. private.key
2. private.pem
3. www.web-site.com.csr
4. sf_bundle.crt
5. your-domain.com.crt

Now open your load balancer console and add https support. it will prompt you to add following values.

1. Certificate Name:* -> Put any friendly name
2. Private Key:* -> Paste content of private.pem
3. Public Key Certificate:* -> Paste content of your-domain.com.crt.
4. Certificate Chain: -> Paste content of sf_bundle.crt

Once done, Save all these values and here you go.