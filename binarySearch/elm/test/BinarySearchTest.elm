module BinarySearchTest exposing (..)

import String
import BinarySearch
import ElmTest exposing (..)


testSuite : Test
testSuite =
    suite "BinarySearch"
        [ test "Empty List" (assertEqual False (BinarySearch.findNumber [] 1))
        , test "Element present" (assertEqual True (BinarySearch.findNumber [1..6] 5))
        , test "Element not present" (assertEqual False (BinarySearch.findNumber [1..6] 7))
        , test "Unsorted list" (assertEqual True (BinarySearch.findNumber [ 7, 6, 8, 2 ] 7))
        ]
