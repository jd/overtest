#!/bin/sh
source bin/overtest postgresql

testEnvironment ()
{
    assertEquals 9824 ${OVERTEST_POSTGRESQL_PORT}
    assertEquals postgresql ${OVERTEST_DAEMON}
    assertEquals "postgresql:///template1?host=${OVERTEST_POSTGRESQL_DATA}&port=${OVERTEST_POSTGRESQL_PORT}" ${OVERTEST_POSTGRESQL_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_POSTGRESQL_URL}
}


testPSQL ()
{
    psql template1 -c "CREATE TABLE FOOBAR();"
}
