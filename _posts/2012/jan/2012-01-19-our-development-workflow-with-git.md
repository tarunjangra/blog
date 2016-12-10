---
layout: post
title: "Our development workflow with gitflow"
date: 2012-1-19
description: |
  Development workflow has to be so smooth and git is an integral part to achieve the smoothest development workflow. Where 
  gitflow methodology has made it more effective for us.
tags:
- GIT
- Collaboration
- Agile
---
 

We are using git since 2009. Recently we have been forced by a platform to implement better development workflow. Where we 
handle better branching, code releases etc. And we found gitflow, A collection of git extensions provide high level of git 
based operations. I found it pretty much worthy to share our experience. Earlier than gitflow, we were using git with Master 
branch only where all developers suppose to push and code is suppose to move to development server and after testing, 
it is suppose to deploy on production server. Which is bit cumbersom process. and as we are getting in the requirement of better 
tracked development with less efforts we start feeling to have some serious process to get in. We have followed Vincent Driessen's 
branching model.

![Gitflow]({{ site.url }}/assets/git-workflow-gitflow.png)

Master branch will be now our production ready branch. And Development branch will be our dev server branch. These two branches 
are suppose to be in the system for infinite time. We have learnt to keep  some temporary branches like “Feature branches” and 
“Release branches” which will really play a great role in the architecture we are workingin. We are using “Pivotal Tracker” for 
our Agile methodology, So when we have new milestone with multiple stories for a particular feature. It means, developer 
need to create new branche with the name “Feature/<feature-name>“. This branch is suppose to be cloned from master branch 
and suppose to be in the system till the completion of the feature. And then merge back to master branch. So in the whole 
release we are suppose to complete all pivotal stories by story ids.

I am looking for some automatic process where all stories get started when developer creates the Feature branch. And when 
he deliver the whole feature and merge the branch back to the development. It should automatically change the status of the 
story to be “Delivered”. QA team will test and either accept or reject the corresponding story. I know webhooks provided
by github.com which can be implemented to achieve this with pivotal tracker.

Overall, Gitflow methodology make the development flow quite better then what we were doing ealrier.