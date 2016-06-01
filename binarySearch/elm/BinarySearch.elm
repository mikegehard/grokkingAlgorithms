module BinarySearch exposing (..)

-- There is an issue searching a list bigger than ~10000
-- because not tail recursive
-- RangeError: Maximum call stack size exceeded
findNumber : List Int -> Int -> Bool
findNumber numbers numberToFind =
  let
    middleIndex = List.length numbers // 2
    firstHalf = List.take middleIndex numbers
    lastHalf = List.drop middleIndex numbers
    _ = Debug.log "guess" 1
  in
    case List.head lastHalf of
        Just(middleElement) ->
            if numberToFind == middleElement then
              True
            else if numberToFind < middleElement then
              findNumber firstHalf numberToFind
            else
              findNumber lastHalf numberToFind
        Nothing -> False
