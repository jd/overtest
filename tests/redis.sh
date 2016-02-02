#!/bin/sh
OVERTEST_REDIS_SENTINEL_ENABLE=1
source bin/overtest redis

testEnvironment ()
{
    assertEquals redis ${OVERTEST_DAEMON}
    assertEquals "redis://localhost:6380?sentinel=overtest" ${OVERTEST_REDIS_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_REDIS_URL}
}

testRedis ()
{
    redis-cli -p ${OVERTEST_REDIS_PORT} llen overtest
}

testSentinelRedis ()
{
    redis-cli -p ${OVERTEST_REDIS_SENTINEL_PORT} sentinel master overtest
}
