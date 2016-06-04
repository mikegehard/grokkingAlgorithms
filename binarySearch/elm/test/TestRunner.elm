module TestRunner exposing (..)

import BinarySearch exposing (..)
import ElmTest exposing (..)

tests : Test
tests = BinarySearch.tests

main : Program Never
main =
    runSuite tests
