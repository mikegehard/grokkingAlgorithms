module TestRunner exposing (..)

import StackTest exposing (..)
import ElmTest exposing (..)

tests : Test
tests = StackTest.testSuite

main : Program Never
main =
    runSuite tests
