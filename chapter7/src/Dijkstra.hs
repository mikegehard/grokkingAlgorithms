module Dijkstra where

import           Data.HashMap.Strict

type Node = String
type Weight = Int

type Graph = HashMap Node Neighbors
type Neighbors = HashMap Node Weight

type Costs = HashMap Node Int

type Parents = HashMap Node Node

{-
let aNeighbors = fromList [("Finish", 1)]
let bNeighbors = fromList [("A", 3), ("Finish", 5)]
let finishNeighbors = empty
let graph = fromList [("Start", startNeighbors), ("A", aNeighbors), ("B", bNeighbors), ("Finish", finishNeighbors) ]

S -> A
S -> B
B -> A
A -> Finish
-}

fromList :: [((Node, Node), Weight)] -> Graph
fromList nodes = empty

shortestDistance :: Node -> Node -> Graph -> [Node]
shortestDistance start end graph = []
