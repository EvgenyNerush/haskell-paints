module Data.Paints (ColourMatrix, ColourMatrix(..), sortByLuminance, toList, dropEven, dropOdd) where

import Data.Colour
import Data.Colour.CIE

data ColourMatrix a = ColourMatrix [Colour a]

raws :: (Fractional a) => (ColourMatrix a) -> [[Colour a]]
raws (ColourMatrix cl) = map (\x -> map (blend 0.5 x) cl) cl

-- с повторами
toListSimple :: (Fractional a) => (ColourMatrix a) -> [Colour a]
toListSimple cm = foldr (++) [] $ raws cm

-- без повторов, верхний треугольник
toList :: (Fractional a) => (ColourMatrix a) -> [Colour a]
toList (ColourMatrix []) = []
toList (ColourMatrix cl@(x:xs)) = (x:(map (blend 0.5 x) xs)) ++ toList (ColourMatrix xs)

dropEven :: [a] -> [a]
dropEven [] = []
dropEven (x:[]) = x:[]
dropEven (x:y:xs) = x:(dropEven xs)

dropOdd :: [a] -> [a]
dropOdd [] = []
dropOdd (x:xs) = dropEven xs

qsort :: Ord a => (b -> a) -> [b] -> [b]
qsort _ [] = []
qsort measure (head:tail) = qsort measure lhs ++ [head] ++ qsort measure rhs
    where lhs = filter (\x -> measure x < headNorm) tail
          rhs = filter (\x -> measure x >= headNorm) tail
          headNorm = measure head

sortByLuminance :: (Fractional a, Ord a) => [Colour a] -> [Colour a]
sortByLuminance = qsort luminance
