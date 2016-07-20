module Queue where

type Queue a = [a]

enqueue :: a -> Queue a -> Queue a
enqueue item queue = queue ++ [item]

dequeue :: Queue a -> (Maybe a, Queue a)
dequeue [] = (Nothing, [])
dequeue (x : xs) = (Just x, xs)

empty :: Queue a
empty = []
