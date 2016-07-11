---
layout: post
title: "ElasticSearch restore failed when s3-gateway is activated"
date: 2014-07-11
description: |
  ElasticSearch restore failed when s3-gateway is activated. And it made me in the
  kind of situation which are really tough to recorver from.
tags:
- blogging
- tarun jangra
- elastic search
- elastica
- S3-gateway
---

Hufffff, Unfortunately i met this edge case. I have recovered from this situation. Here’s my scenario.

- I am on ElasticSearch Version 1.1.0
- I have two data nodes. One is primary and other is replica.
- I am taking regular snapshots of my indexes.
- I am no more taking snapshots, So I have installed s3-gateway plugin to keep updating s3 buckets for persistent indexes.

Because of bulk import, i have stopped my replica to make import little faster. Once import get completed. I felt high CPU and Memory usage. And since i was aware that my indexes are safe because i am supporting s3-gateway. So i decided to restart remaining data node. Fuck…. It was a big mistake. When i tried to restart, it was not recovering all indexes. And we were about to launch our site in next two hours. And i am left with no index.

Struggling here and there, i came to know that i am suffered with Bug in ElasticSearch. I tried to follow instruction at the end of this thread where i was suppose to update/edit metadata file from s3-bucket. I did that but no luck.

Problem i found, All indexes and shards suppose to have _source folders. And i had so many indexes and their shards where _source folder was missing. And those indexes were unrecoverable. I have no solutions at that place and was literately sweating in Air Conditioned Room. 

Then one of my colleague, Narinder Kaur has joined me. And she gave me necessary support and we tried some more messes to fix it. Since i already made a mistake, So i took one backup of existing elasticsearch so that i would be able to back at same place in case of any other mess. And solutions we were planning to try was totally crap.

So, Solution we tried. and which actually works….. Wow!.

1. I updated my elasticsearch.yml, and remove s3-gateway settings related to my s3 bucket.
2. I stopped elasticsearch.
3. I rename my old cluster (elasticsearch) to elasticsearch.original.
4. Restarted Elasticsearch. And it created new blank cluster. where i have no indexes.
5. I created all required indexes with the same number of shards and replicas i previously had. In my case i had 5 indexes and 5 shards per index.
6. Now i stop elasticsearch again.
7. Start deleting (elasticsearch/nodes/0/indices/<index_name>/<0,1,2,3,4>/{index,translog}. And move (elasticsearch.original/nodes/0/indices/<index_name>/<0,1,2,3,4>/{index,translog}) to (elasticsearch/nodes/0/indices/<index_name>/<0,1,2,3,4>/{index,translog})
**Note**: Here, i did not touch _state folder of blank indexes. And now my all indexes has _status folder in each shard and each index.
8. I copied all indexes as in 5th step.
9. Restart ElasticSearch. and i found all indexes were recovered.

Observation: Well you should run your all custom mappings in blank indexes. I found some errors because i did not execute my mapping.

Thank god, Now all indexes were recovered. And Thanks to Narinder Kaur, she got me required support at that time.