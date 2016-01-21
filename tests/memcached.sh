#!/bin/sh
source bin/overtest memcached

testEnvironment ()
{
    assertEquals memcached ${OVERTEST_DAEMON}
    assertEquals "memcached://localhost:11212" ${OVERTEST_MEMCACHED_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_MEMCACHED_URL}
}
