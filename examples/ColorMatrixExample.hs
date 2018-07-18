{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Cairo
import Data.Paints.ColourSets
import Data.Paints

cm = ColourMatrix $ reverse $ sortByLuminance set6

glue :: (Diagram B -> Diagram B -> Diagram B) -> [Diagram B] -> Diagram B
glue glueF (d:[]) = d
glue glueF (d:ds) = glueF d (glue glueF ds)

glueBeside = glue (|||)

glueAbove = glue (===)

dia :: (ColourMatrix Double) -> Diagram B
dia = glueAbove . (map f) . raws
    where f = glueBeside . (map (\x -> square 1 # fc x # lw none))

main = renderCairo "colorMatrixExample.png" (dims $ V2 400 400) $ dia cm
