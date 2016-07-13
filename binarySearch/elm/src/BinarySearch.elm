module BinarySearch exposing (..)

-- There is an issue searching a list bigger than ~10000
-- because not tail recursive
-- RangeError: Maximum call stack size exceeded


findNumber : List comparable -> comparable -> Bool
findNumber numberToFind numbers =
    case numbers of
        [] ->
            False

        [ number ] ->
            number == numberToFind

        _ ->
            let
                sortedList =
                    List.sort numbers

                middleIndex =
                    List.length sortedList // 2

                lastHalf =
                    List.drop middleIndex sortedList

                foo =
                    findNumber numberToFind

                _ =
                    Debug.log "guess" 1
            in
                case List.head lastHalf of
                    Just middleElement ->
                        if numberToFind == middleElement then
                            True
                        else if numberToFind < middleElement then
                            List.take middleIndex sortedList |> foo
                            -- findNumber numberToFind (List.take middleIndex sortedList)
                        else
                            lastHalf |> foo

                    Nothing ->
                        False
