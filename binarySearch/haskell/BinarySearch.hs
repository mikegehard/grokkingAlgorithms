module BinarySearch where

    find :: Ord a => a -> [a] -> Bool
    find _ [] = False
    find numberToFind [x] = numberToFind == x
    find numberToFind xs =
        let
            middleElementIndex = length xs `quot` 2
            middleElement = xs !! middleElementIndex
        in
            if middleElement == numberToFind then
                True
            else
                if middleElement > numberToFind then
                    find numberToFind (take middleElementIndex xs)
                else
                    find numberToFind (drop middleElementIndex xs)
