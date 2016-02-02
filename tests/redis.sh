#!/bin/sh
source bin/overtest redis

testEnvironment ()
{
    assertEquals redis ${OVERTEST_DAEMON}
    assertEquals "redis://localhost:6379" ${OVERTEST_REDIS_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_REDIS_URL}
}


testRedis ()
{
    redis-cli -p ${OVERTEST_REDIS_PORT} llen overtest
}
