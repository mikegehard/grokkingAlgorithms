module Sum where

    sum :: Num a => [a] -> a
    sum [] = 0
    sum [x] = x
    sum (x : xs) = x + Sum.sum xs
