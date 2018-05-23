-- Ignore this section. This is just some preamble stuff.

{-# OPTIONS_GHC -fno-warn-unused-matches #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# LANGUAGE NoImplicitPrelude #-}

module List where

import Prelude hiding (Maybe(..), filter, head, id, length, map, maybe, reverse)
import Data.Char (chr)

------------------------------------------------------------------------------
-- Review: insight from types alone

id :: a -> a
id x = x

-- Q: Does the type of 'id' tell us anything?

someIntyFunction :: (Int -> Int) -> Int -> Int
someIntyFunction f x = undefined

-- Q: Does the type of 'someIntyFunction' tell us anything?

-- E: Implement 'someIntyFunction'.

-- Q: Is there more than one way to implement 'someIntyFunction'?

someFunction :: (a -> a) -> a -> a
someFunction f x = undefined

-- Q: Is there more than one way to implement 'someFunction'?

anotherFunction :: (a -> b) -> a -> b
anotherFunction f x = undefined

-- Q: Is there more than one way to implement 'anotherFunction'?

{-
function id(x) {
  return x;
}
-}

-- Q: How does the insight we get from the _type_ of the Haskell function 'id'
--    compare to the insight we get from the JS function 'id'?

------------------------------------------------------------------------------
-- Review: Maybe

data Maybe a = Nothing
             | Just a

maybeInt :: Maybe Int
maybeInt = Just 42

maybeInt' :: Maybe Int
maybeInt' = Nothing

-- Q: What is the type of Just?

-- Q: What is the type of Nothing?

fromMaybe :: a -> Maybe a -> a
fromMaybe d Nothing  = d
fromMaybe _ (Just x) = x

-- Q: Does the type of 'fromMaybe' tell us anything?

-- Q: Is there more than one way to implement 'fromMaybe'?

maybe :: b -> (a -> b) -> Maybe a -> b
maybe d _ Nothing  = d
maybe _ f (Just x) = f x

-- Q: Does the type of 'maybe' tell us anything?

-- Q: Is there more than one way to implement 'maybe'?

-- Q: Can we write 'fromMaybe' in terms of 'maybe'?

------------------------------------------------------------------------------
-- Review: List

data List a = Empty
            | Link a (List a)

exampleList :: List Int
exampleList = Empty

exampleList' :: List Int
exampleList' = Link 1 (Link 2 (Link 3 Empty))

-- The actual list type in Haskell looks a bit different, but the idea is the same.
-- In pseudo-Haskell syntax
--   data [a] = [] | a : [a]

-- In our custom 'List' data type above, 'Empty' becomes '[]' and Link becomes ':':

someList :: [Int]
someList = []

someList' :: [Int]
someList' = 1 : 2 : 3 : []

someList'' :: [Int]
someList'' = [1, 2, 3, 4]

-- We will use the actual list type from here on out.

-- Q: What is the type of (:)?

-- Q: What is the type of []?

------------------------------------------------------------------------------
-- New: Basic list functions
length :: [a] -> Int
length xs = undefined

-- E: Implement 'length'.
--
append :: [a] -> [a] -> [a]
append xs ys = undefined

-- E: Implement 'append'.

reverse :: [a] -> [a]
reverse list = undefined

-- E: Implement 'reverse'.

-- head :: ???
-- head xs = undefined

-- E: Write a function called 'head' that returns the first element of a list.

map :: (a -> b) -> [a] -> [b]
map f xs = undefined

-- E: Implement 'map'.

double :: (Int -> Int) -> [Int] -> [Int]
double f xs = undefined

-- E: Write a function called 'double' that doubles every element of a list of 'Int'.

filter :: (a -> Bool) -> [a] -> [a]
filter predicate xs = undefined

-- E: Write a function called 'filter' that selects elements from a list.

-- find :: ???
-- find predicate xs = undefined

-- E: Write a function called 'find' that finds the first element from a list
-- that satisfies a predicate.

-- 'map' and 'filter' are 2 (out of 3) of the most fundamental list functions
-- in Haskell!

------------------------------------------------------------------------------
-- Aside: 'String' type in Haskell

-- There is a type synonym in the standard libraries called 'String' that
-- is equivalent to '[Char]'.

-- Haskell lets us write literal 'String' values like this:
--   "abcd"
--   "hmm, i'm pretty darn sure that is the droid i'm looking for"
--
-- but behind the scenes, this is just sugar for the same list construction
-- syntax we have seen above:
--   "abcd" == ['a', 'b', 'c', 'd'] == 'a' : 'b' : 'c' : 'd' : []

-- A type synonym in Haskell, i.e.:
--   type String = [Char]
--
-- gives a new name (or alias) to an existing type an we can use the alias
-- or the existing type interchangeably.  For example, a function with
-- this signature:
--
--   isAlphaNumeric :: String -> Bool
--
-- could also have been defined like this:
--
--   isAlphaNumeric :: [Char] -> Bool

------------------------------------------------------------------------------
-- Homework: Implement the undefined parts of 'intToString' below.
--
-- It should return the string representation of an 'Int', so:
--   intToString 42 == "42" == ['4', '2']
--   intToString 9000 == "9000" == ['9', '0', '0', '0']
--
-- Assume that negative 'Int' values will never be passed to the function.
--
-- Can use these standard library functions to help with implementing this:
--   chr :: Int -> Char
--     chr 48 == '0'
--     chr 49 == '1'
--     ...
--
--   divMod :: Int -> Int -> (Int, Int)
--     5 `divMod` 2 == (2, 1), i.e. 2 goes into 5: 2 times cleanly, 1 remainder
--     5 `divMod` 4 == (1, 1), i.e. 4 goes into 5: 1 time cleanly, 1 remainder
intToString :: Int -> [Char]
intToString num = reverse (digitsToChars (intToDigits num)) where
  digitsToChars :: [Int] -> [Char]
  digitsToChars digits = undefined

  intToDigits :: Int -> [Int]
  intToDigits i = undefined
