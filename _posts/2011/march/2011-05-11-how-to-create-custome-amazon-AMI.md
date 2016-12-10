---
layout: post
title: "How to create custom amazon AMI throught CLI Commands"
date: 2011-06-10
description: |
  Here i will put together some command which will help you to create your custom AMI to be used for your custom requirement.
tags:
- AMI
- AWS
- Amazon
- CLI
---


Today, i am going to explain how you can create custom amazon ami to launch instance anytime later. 
This will have you clone of your server anytime you need. I am considering you are able to login your current running 
instance and you also have your private key and certificate downloaded on some location. <!--more-->

![Aamazon AMI]({{ site.url }}/images/assets/ami_lifecycle.png)

Upload your private key and certificate on the running instance.

{% highlight bash %}
scp -i path/of/yourkeypair.pem path/of/cert.pem /mnt
scp -i path/of/yourkeypair.pem path/of/pk.pem /mnt
{% endhighlight %}

Login to your instance and check if uploaded files are available in /mnt.

{% highlight bash %}
ec2-bundle-vol -d /mnt -k /mnt/pk.pem -c /mnt/cert.pem -u 673491274719 -p name-of-ami
{% endhighlight %}

This will take some time and create the desired ami to be uploaded in the bucket. So you can use that later anytime you need.
Now upload your bundle to amazon s3 storage.

{% highlight bash %}
ec2-upload-bundle -b <S3-bucket-name> -m /mnt/name-of-ami.manifest.xml -a <AWS-access-key-id> -s  <AWS-secret-access-key> --location US-EAST-1C
{% endhighlight %}

Note: Remember to upload to an S3 bucket in correct region. Also: if the bucket does not exit, it will be created for you. (I’ve used a European bucket as an example.)
Now we need to register AMI. Do following< br />

{% highlight bash %}
ec2-register <bucket-name>/sampleimage.manifest.xml --region US-EAST-1C
{% endhighlight %}

It will return the new AMI ID (like ami-).
That’s it you are done with your custom ami.