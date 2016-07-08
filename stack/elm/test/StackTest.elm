module StackTest exposing (..)

import Stack exposing (..)
import Maybe
import ElmTest exposing (..)


testSuite : Test
testSuite =
    suite "Stack"
        [ test "Popping empty stack" (assertEqual ( Maybe.Nothing, empty ) (pop empty))
        , pushingItemOntoStack
        ]


pushingItemOntoStack =
    let
        expectedStack =
            Stack.empty |> push 2

        startingStack =
            expectedStack |> push 1
    in
        test "Pushing items onto a stack" (assertEqual ( Maybe.Just 1, expectedStack ) (pop startingStack))
