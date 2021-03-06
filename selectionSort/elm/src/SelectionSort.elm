module SelectionSort exposing (..)


sort : List comparable -> List comparable
sort items =
    let
        -- max = List.maximum items
        min =
            List.minimum items

        remove : comparable -> List comparable -> List comparable
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
        remove item items =
            List.filter ((/=) item) items
    in
        -- case max of
        case min of
            Nothing ->
                items

            Just m ->
                -- sort (remove m items) ++ [m]
                m :: sort (remove m items)
