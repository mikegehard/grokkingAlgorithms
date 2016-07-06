module QuickSort where

    import Data.List (partition)

    sort :: [Int] -> [Int]
    sort [] = []
    sort [x] = [x]
    sort (y : ys) =
        let
            -- if you pick the pivot randomly you can assure that
            -- you will remain O(n log n) instead of O(n^2) on 
            -- average.
            pivot = y
            -- this is where the n in O(n log n) comes from.
            (lessThanElements, greatherThanElements) = partition (< pivot) ys
        in
            sort lessThanElements ++ [pivot] ++ sort greatherThanElements
