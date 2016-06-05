module SelectionSort exposing (..)

sort : List Int -> List Int
sort items =
  let
    max = List.maximum items
    remove : Int -> List Int -> List Int
    -- This can be implemented multiple ways...
    -- remove item items =
    --   case items of
    --     [] ->
    --       []
    --     (x::xs) ->
    --       if x == item then
    --         xs
    --       else
    --         x :: remove item xs
    -- remove item items = List.filter (\i -> i /= item) items
    remove item items = List.filter ((/=) item) items

  in
    case max of
      Nothing -> items
      Just(m) ->
        sort (remove m items) ++ [m]
