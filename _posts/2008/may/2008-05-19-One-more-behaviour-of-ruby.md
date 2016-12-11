---
layout: post
title: "One more behaviour of ruby"
date: 2008-05-19
description: |
  Working with ruby is really fun. and as i'm moving ahead i'm getting more suprised how cool a language could be.
tags:
- Ruby
- Rubylearning
---

Today while working with ruby i noticed one more surprising behaviour of ruby.

<!--more-->

{% highlight ruby %}
arg1="Ruby", arg2="On", arg3="Rails" 
puts "#{arg1},#{arg2},#{arg3}"
{% endhighlight %}

### What should be the results?

Well i was expecting to be printed like “Ruby”,”On”,”Rails” but the result was “RubyonRails”, “On”, “Rails”. To understand this 
behaviour i did some more experiments in “irb”

{% highlight ruby %}
puts arg1.class.to_s    
#result  Array 
puts arg2.class.to_s  
#result String 
puts arg3.class.to_s    
#result String
{% endhighlight %}

Now the question is, Why arg1 is interpreted as an array? and why not the arg2?
