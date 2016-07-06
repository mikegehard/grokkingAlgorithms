module QuickSort where

    import Data.List (partition)

    sort :: [Int] -> [Int]
    sort [] = []
    sort [x] = [x]
    sort (y : ys) =
        let
            pivot = y
            -- this is where the n in O(n log n) comes from.
            (lessThanElements, greatherThanElements) = partition (< pivot) ys
        in
            sort lessThanElements ++ [pivot] ++ sort greatherThanElements
