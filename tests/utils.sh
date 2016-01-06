#!/bin/bash
source lib/_utils

testParseOptions ()
{
    overtest_parse_options foobar
    assertEquals 1 $?
}
