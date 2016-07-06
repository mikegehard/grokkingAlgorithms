module CountListItems where
    countItems :: [a] -> Int
    countItems [] = 0
    countItems (x:xs) = 1 + countItems xs
