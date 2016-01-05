#!/bin/sh
source bin/overtest postgresql

testEnvironment()
{
    assertEquals 9824 ${OVERTEST_POSTGRESQL_PORT}
    assertEquals postgresql ${OVERTEST_DAEMON}
    assertEquals "postgresql:///?host=${OVERTEST_POSTGRESQL_DATA}&port=${OVERTEST_POSTGRESQL_PORT}&dbname=template1" ${OVERTEST_POSTGRESQL_URL}
}

