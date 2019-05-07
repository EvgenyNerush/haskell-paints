{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

{-# LANGUAGE TemplateHaskell #-}

import Diagrams.Prelude
import Diagrams.Backend.Cairo
import Data.Paints.ColourSets
import Data.Paints
import Data.Paints.Names
-- import Data.Colour (black)
-- import Data.Colour.CIE (blend)
import Shared

nColumns = 5 :: Int
colorNames = ["chromeYellow", "cadmiumRed", "cobaltGreenLight", "naplesBlueSpectral", "cobaltViolet"]

--colors = [blend 0.5 chromeYellow cadmiumRed, cadmiumRed, blend 0.5 cobaltGreenLight chromeYellow, blend 0.3 naplesBlueSpectral black, cobaltViolet]
--colors = [chromeYellow, cadmiumRed, cobaltGreenLight, naplesBlueSpectral, cobaltViolet]
colors = light_sail

nRaws = ceiling $ fromIntegral (length colors) / fromIntegral nColumns

nVoid = if nRaws > 1 then nRaws * nColumns - length colorNames else 0

colorsAndNames = zip colors colorNames ++ replicate nVoid (white, "")

plasticNumber = 1.325

myCircle :: (Colour Double, String) -> Diagram B
myCircle (col, name) = text name # fontSizeL 0.2 # fc white
                `atop` circle 1 # fc col # lw none
                `atop` square (2 * plasticNumber) # fc white # lw none

glue :: (Diagram B -> Diagram B -> Diagram B) -> [Diagram B] -> Diagram B
glue glueF (d:[]) = d
glue glueF (d:ds) = glueF d (glue glueF ds)

glueBeside = glue (|||)

glueAbove = glue (===)

makeRaws :: [a] -> [[a]]
makeRaws [] = []
makeRaws xs = [heads] ++ makeRaws tails
    where heads = take nColumns xs
          tails = drop nColumns xs

dia :: [(Colour Double, String)] -> Diagram B
dia cols = glueAbove $ map (glueBeside . (map myCircle)) $ makeRaws cols

main = renderCairo "Palette.png" (dims $ V2 (100 * fromIntegral nColumns) (100 * fromIntegral nRaws)) $ dia colorsAndNames
