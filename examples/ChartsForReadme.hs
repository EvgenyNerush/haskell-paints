{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Cairo
import Data.Paints.ColourSets

together :: [Diagram B] -> Diagram B
together (d:[]) = d
together (d:ds) = d `atop` together ds

colorChart' :: [Colour Double] -> [Diagram B]
colorChart' colors = go n n colors
    where n = fromIntegral $ length colors
          go n 1 (c:_) = [myWedge 1 c]
          go n m (c:cs) = (myWedge m c):(go n (m - 1) cs)
          myWedge m c = wedge 1 (rotate ((m - 1) / n @@ turn) xDir) (1/n @@ turn) # fc c # lw none

colorChart :: [Colour Double] -> Diagram B
colorChart colors = together $ colorChart' colors

main = renderCairo "chartsForReadme.png" (dims $ V2 150 150) $ colorChart set1
