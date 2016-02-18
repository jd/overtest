#!/bin/sh
source bin/overtest gnocchi

testEnvironment ()
{
    assertEquals gnocchi ${OVERTEST_DAEMON}
    assertEquals "gnocchi://localhost:8041" ${OVERTEST_GNOCCHI_URL}
    assertEquals "http://localhost:8041" ${OVERTEST_GNOCCHI_HTTP_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_GNOCCHI_URL}
}


testGnocchi ()
{
    curl -s $OVERTEST_GNOCCHI_HTTP_URL | grep -q v1.0
}
