#!/bin/sh
source bin/overtest zookeeper

testEnvironment ()
{
    assertEquals zookeeper ${OVERTEST_DAEMON}
    assertEquals "zookeeper://localhost:2181" "${OVERTEST_ZOOKEEPER_URL}"
    assertEquals "${OVERTEST_URL}" "${OVERTEST_ZOOKEEPER_URL}"
}


testZooKeeper ()
{
    echo ruok | nc 127.0.0.1 2181 | grep -q imok
}
