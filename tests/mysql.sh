#!/bin/sh
source bin/overtest mysql

testEnvironment ()
{
    assertEquals mysql ${OVERTEST_DAEMON}
    assertEquals "mysql://root@localhost/test?unix_socket=${OVERTEST_MYSQL_DATA}/mysql.socket" ${OVERTEST_MYSQL_URL}
    assertEquals ${OVERTEST_URL} ${OVERTEST_MYSQL_URL}
}


testMySQL ()
{
    mysql --no-defaults -S ${OVERTEST_MYSQL_SOCKET} -e "SHOW TABLES;" test
}
