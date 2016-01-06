#!/bin/bash
source lib/_utils

testParseOptions ()
{
    overtest_parse_options foobar
    assertEquals 2 $?
    overtest_parse_options -h
    assertEquals 1 $?
    overtest_parse_options --help
    assertEquals 1 $?
}
