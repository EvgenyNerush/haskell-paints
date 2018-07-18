module Data.Paints where

import Data.Colour
import Data.Colour.CIE

data ColourMatrix a = ColourMatrix [Colour a]

raws :: (Fractional a) => (ColourMatrix a) -> [[Colour a]]
raws (ColourMatrix cl) = map (\x -> map (blend 0.5 x) cl) cl

toList :: (Fractional a) => (ColourMatrix a) -> [Colour a]
toList cm = foldr (++) [] $ raws cm

qsort :: Ord a => (b -> a) -> [b] -> [b]
qsort _ [] = []
qsort measure (head:tail) = qsort measure lhs ++ [head] ++ qsort measure rhs
    where lhs = filter (\x -> measure x < headNorm) tail
          rhs = filter (\x -> measure x >= headNorm) tail
          headNorm = measure head

sortByLuminance :: (Fractional a, Ord a) => [Colour a] -> [Colour a]
sortByLuminance = qsort luminance
