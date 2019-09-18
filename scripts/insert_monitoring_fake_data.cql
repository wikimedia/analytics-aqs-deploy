----------------------------------------------------------------------
-- CQL commands to insert fake data for monitoring
-- Usage:
--
-- cqlsh -u cassandra -p cassandra aqsXXXX.eqiad.wmnet -f insert_monitoring_fake_data.cql
--


----------------------------------------------------------------------
-- Per-project pageview data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/pageviews/aggregate/en.wikipedia/all-access/all-agents/hourly/1970010100/1970010100
-- Expected result: {"items":[{"project":"en.wikipedia","access":"all-access","agent":"all-agents","granularity":"hourly","timestamp":"1970010100","views":0}]}

INSERT INTO "local_group_default_T_pageviews_per_project_v2"."data" (
  "_domain", project, access, agent, granularity, timestamp, "_tid", "_del", views, v
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-access', 'all-agents', 'hourly', '1970010100', minTimeuuid('1970-01-01'), null, 0, 0
);


----------------------------------------------------------------------
-- Per-article pageview data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/pageviews/per-article/en.wikipedia/all-access/all-agents/-/daily/1970010100/1970010100
-- Expected result: {"items":[{"project":"en.wikipedia","article":"-","granularity":"daily","timestamp":"1970010100","access":"all-access","agent":"all-agents","views":0}]}

INSERT INTO "local_group_default_T_pageviews_per_article_flat"."data" (
  "_domain", project, article, granularity, timestamp, "_tid", "_del", aa
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', '-', 'daily', '1970010100', minTimeuuid('1970-01-01'), null, 0
);


----------------------------------------------------------------------
-- Top pageview data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/pageviews/top/en.wikipedia/all-access/daily/1970010100/1970010100
-- Expected result: {"items":[{"project":"en.wikipedia","access":"all-access","year":"1970","month":"01","day":"01","articles":[{"article":"-","views":0,"rank":1}]}]}

INSERT INTO "local_group_default_T_top_pageviews"."data" (
  "_domain", project, access, year, month, day, "_tid", "_del", "articlesJSON"
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-access', '1970', '01', '01', minTimeuuid('1970-01-01'), null, '[{"article":"-","views":0,"rank":1}]'
);

----------------------------------------------------------------------
-- Top by country data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/pageviews/top-by-country/en.wikipedia/all-access/1970/01
-- Expected result: {"items":[{"project":"en.wikipedia","access":"all-access","year":"1970","month":"01","countries":[{"country":"-","views":0,"rank":1}]}]}

INSERT INTO "local_group_default_T_top_bycountry"."data" (
  "_domain", project, access, year, month, "_tid", "_del", "countriesJSON"
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-access', '1970', '01', minTimeuuid('1970-01-01'), null, '[{"country":"-","views":0,"rank":1}]'
);


----------------------------------------------------------------------
-- Unique-devices data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/unique-devices/en.wikipedia/all-sites/daily/1970010100/1970010100
-- Expected result: {"items":[{"project":"en.wikipedia","access-site":"all-sites","granularity":"daily","timestamp":"1970010100","devices":0}]}

INSERT INTO "local_group_default_T_unique_devices"."data" (
  "_domain", project, "access-site", granularity, timestamp, "_tid", "_del", devices, underestimate, offset
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-sites', 'daily', '19700101', minTimeuuid('1970-01-01'), null, 0, 0, 0
);


----------------------------------------------------------------------
-- Per-project pagecounts data (legacy)
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/legacy/pagecounts/en.wikipedia/all-sites/daily/1970010100/1970010100
-- Expected result: {"items":[{"project":"en.wikipedia","access-site":"all-sites","granularity":"daily","timestamp":"1970010100","count":0}]}

INSERT INTO "local_group_default_T_lgc_pagecounts_per_project"."data" (
  "_domain", project, "access-site", granularity, timestamp, "_tid", "_del", count
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-sites', 'daily', '1970010100', minTimeuuid('1970-01-01'), null, 0
);

----------------------------------------------------------------------
-- Per-file mediarequest data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/mediarequests/per-file/en.wikipedia/all-agents/-/daily/1970010100/1970010100
-- Expected result: {"items":[{"referer":"en.wikipedia","file_path":"-","granularity":"daily","timestamp":"1970010100","agent":"all-agents","requests":0}]}

INSERT INTO "local_group_default_T_mediarequest_per_file"."data" (
  "_domain", referer, file_path, granularity, timestamp, "_tid", "_del", spider, user
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', '-', 'daily', '1970010100', minTimeuuid('1970-01-01'), null, 0, 0
);

----------------------------------------------------------------------
-- Per referer mediarequest data
-- Test URL: localhost:7232/analytics.wikimedia.org/v1/mediarequests/aggregate/en.wikipedia/all-media-types/all-agents/daily/1970010100/1970010100
-- Expected result: {"items":[{"referer":"en.wikipedia","media_type":"all-media-types","granularity":"daily","timestamp":"1970010100","agent":"all-agents","requests":0}]}

INSERT INTO "local_group_default_T_mediarequest_per_referer"."data" (
  "_domain", referer, media_type, agent, granularity, timestamp, "_tid", "_del", requests
) VALUES (
    'analytics.wikimedia.org', 'en.wikipedia', 'all-media-types', 'all-agents', 'daily', '1970010100', minTimeuuid('1970-01-01'), null, 0
);
