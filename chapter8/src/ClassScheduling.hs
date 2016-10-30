module ClassScheduling (classes, schedule, Class(..)) where

import           Data.List

data Class = Class { name       :: String
                    , startTime :: Float
                    , endTime   :: Float
                    } deriving (Show, Eq)

classes :: [Class]
classes = [ Class{name="Art", startTime=9, endTime=10}
    , Class{name="Eng", startTime=9.5, endTime=10.5}
    , Class{name="Math", startTime=10, endTime=11}
    , Class{name="CS", startTime=10.5, endTime=11.5}
    , Class{name="Music", startTime=11, endTime=12}]

schedule :: [Class] -> [Class]
schedule possiblClasses = doWork [] (sortOn endTime possiblClasses)

doWork :: [Class] -> [Class] -> [Class]
doWork currentClasses [] = currentClasses
doWork [] (c : rest) = doWork [c] rest
doWork currentClasses (c : rest) =
    let
        latestEndTime = endTime $ last currentClasses
        classToAdd = [c | startTime c >= latestEndTime]
    in
        doWork (currentClasses ++ classToAdd) rest
