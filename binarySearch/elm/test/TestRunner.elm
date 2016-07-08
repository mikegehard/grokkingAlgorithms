module TestRunner exposing (..)

import BinarySearchTest exposing (..)
import ElmTest exposing (..)


tests : Test
tests =
    BinarySearchTest.testSuite


main : Program Never
main =
    runSuite tests
