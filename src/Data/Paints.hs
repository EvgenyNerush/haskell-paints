module Data.Paints where

import Data.Colour.CIE

qsort :: Ord a => (b -> a) -> [b] -> [b]
qsort _ [] = []
qsort measure (head:tail) = qsort measure lhs ++ [head] ++ qsort measure rhs
    where lhs = filter (\x -> measure x < headNorm) tail
          rhs = filter (\x -> measure x >= headNorm) tail
          headNorm = measure head

sortByLuminance :: (Fractional a, Ord a) => [Colour a] -> [Colour a]
sortByLuminance = qsort luminance
