module BinarySearch exposing (..)

-- There is an issue searching a list bigger than ~10000
-- because not tail recursive
-- RangeError: Maximum call stack size exceeded
findNumber : List comparable -> comparable -> Bool
findNumber numbers numberToFind =
  case numbers of
    [] ->
      False
    [number] ->
      number == numberToFind
    _ ->
      let
        sortedList = List.sort numbers
        middleIndex = List.length sortedList // 2
        firstHalf = List.take middleIndex sortedList
        lastHalf = List.drop middleIndex sortedList
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
