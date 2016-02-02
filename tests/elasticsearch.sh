#!/bin/sh
source bin/overtest elasticsearch

testEnvironment ()
{
    assertEquals elasticsearch ${OVERTEST_DAEMON}
    assertEquals "es://localhost:9200" ${OVERTEST_ELASTICSEARCH_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_ELASTICSEARCH_URL}
}


testElasticsearch ()
{
    curl ${OVERTEST_ELASTICSEARCH_HTTP_URL}/
}
