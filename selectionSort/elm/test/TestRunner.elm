module TestRunner exposing (..)

import SelectionSortTest exposing (..)
import ElmTest exposing (..)


tests : Test
tests =
    SelectionSortTest.testSuite


main : Program Never
main =
    runSuite tests
