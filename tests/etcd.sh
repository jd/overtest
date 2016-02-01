#!/bin/sh
source bin/overtest etcd

testEnvironment ()
{
    assertEquals etcd ${OVERTEST_DAEMON}
    assertEquals "etcd://localhost:4001" ${OVERTEST_ETCD_URL}
    assertEquals "http://localhost:4001" ${OVERTEST_ETCD_HTTP_URL}
}


testEtcd ()
{
    curl ${OVERTEST_ETCD_HTTP_URL}/version
}
