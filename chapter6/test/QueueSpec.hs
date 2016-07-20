module QueueSpec where

import qualified Queue
import           Test.Hspec
import           Test.QuickCheck

spec :: Spec
spec = do
    it "works" $ do
        testQueue 10
    it "works with QuickCheck" $ property testQueue

testQueue :: Int -> Bool
testQueue x  = Queue.dequeue (Queue.enqueue x Queue.empty) == (Just x, Queue.empty)
