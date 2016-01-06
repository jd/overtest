#!/bin/sh
source bin/overtest mysql

testEnvironment ()
{
    assertEquals mysql ${OVERTEST_DAEMON}
    assertEquals "mysql://root@localhost/mysql?unix_socket=${OVERTEST_MYSQL_DATA}/mysql.socket" ${OVERTEST_MYSQL_URL}
}


testMySQL ()
{
    mysql -S ${OVERTEST_MYSQL_SOCKET} -e "SHOW TABLES;" mysql
}
