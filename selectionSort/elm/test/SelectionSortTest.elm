module SelectionSortTest exposing (..)

import String
import SelectionSort
import Array
import ElmTest exposing (..)

testSuite : Test
testSuite =
    suite "SelectionSort"
        [ test "Unordered List" (assertEqual [1,2,3,6,8] (SelectionSort.sort [3,2,1,6,8]))
        ]
