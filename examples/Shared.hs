{-# LANGUAGE TemplateHaskell #-}

module Shared where

import Language.Haskell.TH

{-unWrapStrings :: [String] -> Q Exp
unWrapStrings [] = [| [] |]
unWrapStrings (x:xs) = strToExp x


qwa = "qwe"

qwu :: Q Exp
qwu = return $ LitE (StringL "str")

qwq :: String -> Q Exp
qwq x = return $ VarE (mkName x)

qww :: [String] -> Q Exp
qww [] = [| [] |]
qww (x:xs) = do
  id <- qwq x
  id1 <- qww xs
  return (id:id1)

-- qww xs = map (\x -> qwq x) xs
-- -}
