module BinarySearch exposing (..)

findNumber : List Int -> Int -> Bool
findNumber numbers number =
  case numbers of
    [] -> False
    [n] ->
      let
        _ = Debug.log "guess" 1
      in
        n == number
    _ ->
      let
        middleIndex = List.length numbers // 2
        firstHalf = List.take middleIndex numbers
        lastHalf = List.drop middleIndex numbers
        _ = Debug.log "guess" 1
      in
        if List.member number firstHalf then
          findNumber firstHalf number
        else
          findNumber lastHalf number
