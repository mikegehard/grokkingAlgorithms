module ClassSchedulingSpec where

import           ClassScheduling
import           Data.List
import           Test.Hspec
import           Test.QuickCheck
import           Test.QuickCheck.Arbitrary
import           Test.QuickCheck.Gen

testClasses = [ Class{name="Art", startTime=9, endTime=10}
    , Class{name="Eng", startTime=9.5, endTime=10.5}
    , Class{name="Math", startTime=10, endTime=11}
    , Class{name="CS", startTime=10.5, endTime=11.5}
    , Class{name="Music", startTime=11, endTime=12}]

expectedClasses = [Class {name = "Art", startTime = 9.0, endTime = 10.0}
  ,Class {name = "Math", startTime = 10.0, endTime = 11.0}
  ,Class {name = "Music", startTime = 11.0, endTime = 12.0}]

genTime :: Gen Float
genTime = choose (0, 24)

instance Arbitrary Class where
    arbitrary = do
      name <- arbitrary
      startTime <-  genTime
      endTime <- genTime `suchThat` ( > startTime)
      return $ Class name startTime endTime

-- genClass :: Gen Class
-- genClass = do
--   name <- arbitrary
--   startTime <-  genTime
--   endTime <- genTime `suchThat` ( > startTime)
--   return $ Class name startTime endTime

prop_noTimeOverlap :: [Class] -> Bool
prop_noTimeOverlap classes = noTimeOverlap $ schedule classes

prop_findsEarliestEndingClass :: [Class] -> Bool
prop_findsEarliestEndingClass [] = True
prop_findsEarliestEndingClass classes =
  let
    firstScheduledClass = head $ schedule classes
    earliestEndingClass = head $ sortOn endTime classes
  in
    endTime firstScheduledClass == endTime earliestEndingClass

noTimeOverlap :: [Class] -> Bool
noTimeOverlap []  = True
noTimeOverlap [a] = True
noTimeOverlap (a : b : rest) = endTime a <= startTime b && noTimeOverlap rest

spec :: Spec
spec = do
  describe "schedule" $ do
    it "works with HSpec" $ do
      schedule testClasses `shouldBe` expectedClasses

  describe "schedule" $ do
    it "has no time overlap" $ property prop_noTimeOverlap
    it "finds the earliest ending class" $ property prop_findsEarliestEndingClass

main :: IO ()
main = hspec spec
