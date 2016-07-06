module FindMaximum where

    findMaxiumum :: Ord a => [a] -> a
    -- this makes findMaxiumum a partial function
    -- because it doesn't handle all of the cases
    findMaxiumum [] = undefined
    findMaxiumum [x] = x
    findMaxiumum (x : xs) =
        let
            doIt :: Ord a => a -> [a] -> a
            doIt currentMax [] = currentMax
            doIt currentMax (x : xs) =
                if x > currentMax then
                    doIt x xs
                else
                    doIt currentMax xs
        in
            doIt x xs
