#!/bin/sh
source bin/overtest influxdb

testEnvironment ()
{
    assertEquals 51234 ${OVERTEST_INFLUXDB_PORT}
    assertEquals influxdb ${OVERTEST_DAEMON}
    assertEquals "influxdb://localhost:51234" ${OVERTEST_INFLUXDB_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_INFLUXDB_URL}
}


testClient ()
{
    influx -port $OVERTEST_INFLUXDB_PORT -execute 'create database test'
}
