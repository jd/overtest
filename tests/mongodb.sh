#!/bin/sh
source bin/overtest mongodb

testEnvironment ()
{
    assertEquals mongodb ${OVERTEST_DAEMON}
    assertEquals "mongodb://localhost:29000/test" ${OVERTEST_MONGODB_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_MONGODB_URL}
}


testMongo ()
{
    mongo --norc --host localhost --port ${OVERTEST_MONGODB_PORT} --eval 'quit()'
}
