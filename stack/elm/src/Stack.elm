module Stack exposing (empty, push, pop, Stack)

import Maybe

type alias Stack a = List a

push : a -> Stack a -> Stack a
push item stack = item :: stack

pop : Stack a -> (Maybe a, Stack a)
pop stack =
  case stack of
    [] -> (Maybe.Nothing, empty)
    (y :: ys) -> (Just y, ys)

empty : Stack a
empty = []
