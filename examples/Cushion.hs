{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.Cairo
import Data.Paints.ColourSets
import Data.Colour.Names
import Data.Colour.CIE
import Data.Paints
import Data.Paints.Names
import Shared

inch2pt = (*) 72
cm2pt x = inch2pt $ x / 2.54

w0 = inch2pt 3.4 -- overall width
upm = 10 -- upper margin
lwm = 10 -- lower margin
sm = 30 -- side margins
w = w0 - 2 * sm -- (upm + lwm) -- width and height of the coloured region
h0 = w + upm + lwm
fs = 7 -- 5 -- font size, units - ?

l = 0.5 -- linewidth, pt?

plasma = blend 0.5 white naplesBlueSpectral

halfSine x y = bezier3 (r2 (x, y)) (r2 (2 * x, y)) (r2 (3 * x, 0))
sx = w/128
sy = w/64

--photon = arrowBetween (P $ r2 (0, 0)) (P $ r2 (-w/4/1.5, w/16/1.5)) # lwO l
--photon m a = arrow (-w/4/1.5 * m) # lwO l # rotateBy (-a)
photon m a = (  fromSegments (foldr (++) [] $ replicate x [halfSine sx sy, halfSine sx (-sy)])
             <> arrowBetween' (headLength .~ (output $ 12 * l) $ def) (P $ r2 (fromIntegral x * 6 * sx, 0)) (P $ r2 (fromIntegral x * 6 * sx + w/16, 0))
             ) # rotateBy (1/2 - a) # lwO l
    where x = round $ w/8 * m/(6 * sx)

laserArrow = arrowBetween' (headLength .~ (output $ 14 * l) $ def) (P $ r2 (0, 0)) (P $ r2 (w/4 + w/8, 0)) # lc (blend 0.5 chromeYellow cadmiumRed) # lwO (3 * l)

q = 5 * 6 * sx * (cos $ atan2 (5/12) 1)

dia :: Diagram B
dia = (  circle (fs / 3) # fc cobaltViolet # lw none
      <> photon 1 ((atan2 (1/4) 1) / (2 * pi))
      ) # alignT # alignL
      <> text "γ" # fontSizeO fs # fc black # translate (r2 (w/8 + w/16 + fs/4, -w/8/4 - w/8/16 + 1.5 * fs))
      <> ((  text "e⁺" # fontSizeO fs # fc black # translate (r2 (fs, 1.5 * fs))
          <> circle (fs / 3) # fc cadmiumRed # lw none
          <> arrowBetween' (headLength .~ (output $ 12 * l) $ def) (P $ r2 (0, 0)) (P $ r2 (w/16, 0))) # translate (r2 (w/2 + w/16, w/3-w/8)) # lwO l
          <> fromSegments [ bezier3 (r2 (-w/4/1.5, w/16/1.5)) (r2 (0, w/3)) (r2 (w/4, w/3))
                          , bezier3 (r2 (w/8, 0)) (r2 (w/8*3/2, -w/4)) (r2 (w/8, -w/4))
                          , bezier3 (r2 (-w/32, 0)) (r2 (-w/32, w/8)) (r2 (w/16, w/8))
                          , bezier3 (r2 (1.5*w/16, 0)) (r2 (1.5*w/16, -w/8)) (r2 (w/16, -w/8))
                          , bezier3 (r2 (-w/32, 0)) (r2 (-w/32, w/8)) (r2 (w/16, w/8))
                          ] # lwO l
          <> text "γ'" # fontSizeO fs # fc black # translate (r2 (w/4 + w/8 - q + fs/2, w/3 - w/4 + q*5/12 + 1.75 * fs))
          <> circle (fs / 3) # fc cobaltViolet # lw none # translate (r2 (w/4 + w/8 - q, w/3 - w/4 + q*5/12))
          <> photon 2 ((atan2 (5/12) 1) / (2 * pi)) # translate (r2 (w/4 + w/8, w/3 - w/4))
      )
      <> (( text "e⁻" # fontSizeO fs # fc black # translate (r2 (fs, -1.5 * fs))
         <> circle (fs / 3) # fc cobaltGreenLight # lw none
         <> arrowBetween' (headLength .~ (output $ 12 * l) $ def) (P $ r2 (0, 0)) (P $ r2 (w/16, 0))) # translate (r2 (w/4 + w/5, -w/4)) # lwO l
         <> fromSegments [ bezier3 (r2 (-w/4/1.5, w/16/1.5)) (r2 (0, -w/4)) (r2 (w/4, -w/4))
                       , bezier3 (r2 (w/10, 0)) (r2 (w/10*1.5, w/5)) (r2 (w/10, w/5))
                       , bezier3 (r2 (-w/20, 0)) (r2 (0, -w/5)) (r2 (w/10, -w/5))
                       ] # lwO l
         )
      <> ((  text "" # fontSizeO fs # fc black # translate (r2 (-w/4 + 1.5*w/16, w/2 - 1.25*w/16))
          <> text "laser radiation" # fontSizeO fs # fc black # translate (r2 (0, -w/2 + w/16))
          <> (  laserArrow # translate (r2 (-w/4, w/8 + w/4))
             <> laserArrow # translate (r2 (-w/4, w/8))
             <> laserArrow # translate (r2 (-w/4, -w/8))
             <> laserArrow # translate (r2 (-w/4, -w/8-w/4))
             <> rect (w / 2) w # fc white # lw none
             )
          )
         ||| ((  arrowBetween' (headLength .~ (output $ 12 * l) $ def) (P $ r2 (0, 0)) (P $ r2 (0, w/8)) # lwO l
               <> circle (fs/8) # fc black # lw none
               <> circle (fs/2) # fc plasma # lwO l
               <> text "E" # fontSizeO fs # fc black # translate (r2 (-1.5 * fs, 2.5 * fs))
               <> text "B" # fontSizeO fs # fc black # translate (r2 (-1.5 * fs, 0))
               ) # translate (r2 (w/4 - w/32, 1.5*w/16 - w/8 - w/32))
              <> text "e⁺e⁻ plasma" # fontSizeO fs # fc black # translate (r2 (0, -w/2 + w/16))
              <> rect (w / 2) w # fc plasma # lw none
         ))
      <> square w0 # fc white # lw none # translate (r2 (w/4, upm - lwm)) # scaleY (h0 / w0)

main = renderCairo "Cushion.pdf" (dims $ V2 w0 h0) (dia # font "CMU Serif")

