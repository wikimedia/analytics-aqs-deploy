/usr/local/lib/nagios/plugins/service_checker 127.0.0.1 http://localhost:7232/analytics.wikimedia.org/v1

echo '***************'
echo 'Manually testing some queries (should see Selfie, AC/DC, and Barak_Obama in red)'
echo '***************'


curl localhost:7232/analytics.wikimedia.org/v1/pageviews/per-article/en.wikipedia/all-access/all-agents/Selfie/daily/2016020100/2016020100 | grep --color -o Selfie
curl localhost:7232/analytics.wikimedia.org/v1/pageviews/per-article/en.wikipedia/all-access/all-agents/AC%2FDC/daily/2016020100/2016020100 | grep --color -o "AC/DC"
curl localhost:7232/analytics.wikimedia.org/v1/pageviews/per-article/en.wikipedia/all-access/all-agents/Barak%20Obama/daily/2016020100/2016020100 | grep --color -o Barak_Obama
