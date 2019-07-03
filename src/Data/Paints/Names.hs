-- |Module : Data.Paints.Names
--  Additional colours...
module Data.Paints.Names where

import Data.Colour.SRGB

-- ** TODO: Wes Anderson R palettes

-- * Reds

-- |![alizarinCrimson](images/alizarinCrimson.png)
alizarinCrimson :: (Ord a, Floating a) => Colour a
alizarinCrimson = sRGB24 227 38 54

-- |![cadmiumRed](images/cadmiumRed.png)
cadmiumRed :: (Ord a, Floating a) => Colour a
cadmiumRed = sRGB24 227 0 34

-- |![carmine](images/carmine.png)
carmine :: (Ord a, Floating a) => Colour a
carmine = sRGB24 150 0 24

-- * Oranges

-- |![maize](images/maize.png)
maize :: (Ord a, Floating a) => Colour a
maize = sRGB24 242 198 73

-- |![marigold](images/marigold.png)
marigold :: (Ord a, Floating a) => Colour a
marigold = sRGB24 234 162 33

-- |![yellowOchre](images/yellowOchre.png)
yellowOchre :: (Ord a, Floating a) => Colour a
yellowOchre = sRGB24 221 153 34

-- |![cadmiumOrange](images/cadmiumOrange.png)
cadmiumOrange :: (Ord a, Floating a) => Colour a
cadmiumOrange = sRGB24 237 135 45

-- |![minium](images/minium.png)
minium :: (Ord a, Floating a) => Colour a
minium = sRGB24 237 114 14

-- * Yellows

-- |![cadmiumYellow](images/cadmiumYellow.png)
cadmiumYellow :: (Ord a, Floating a) => Colour a
cadmiumYellow = sRGB24 255 246 0

-- |![chromeYellow](images/chromeYellow.png)
chromeYellow :: (Ord a, Floating a) => Colour a
chromeYellow = sRGB24 255 213 0

-- * Greens

-- |![olivine](images/olivine.png)
olivine :: (Ord a, Floating a) => Colour a
olivine = sRGB24 137 178 67

-- |![cobaltGreenLight](images/cobaltGreenLight.png)
cobaltGreenLight :: (Ord a, Floating a) => Colour a
cobaltGreenLight = sRGB24 0 153 42

-- |![cobaltGreen](images/cobaltGreen.png)
cobaltGreen :: (Ord a, Floating a) => Colour a
cobaltGreen = sRGB24 0 124 34

-- |![cadmiumGreen](images/cadmiumGreen.png)
cadmiumGreen :: (Ord a, Floating a) => Colour a
cadmiumGreen = sRGB24 0 107 60

-- * Blues

-- |![naplesBlueSpectral](images/naplesBlueSpectral.png)
naplesBlueSpectral :: (Ord a, Floating a) => Colour a
naplesBlueSpectral = sRGB24 95 174 227

-- |![lapisLazuli](images/lapisLazuli.png)
lapisLazuli :: (Ord a, Floating a) => Colour a
lapisLazuli = sRGB24 38 97 156

-- |![cobaltBlue](images/cobaltBlue.png)
cobaltBlue :: (Ord a, Floating a) => Colour a
cobaltBlue = sRGB24 0 71 171

-- |![phthalocyanineBlue](images/phthalocyanineBlue.png)
phthalocyanineBlue :: (Ord a, Floating a) => Colour a
phthalocyanineBlue = sRGB24 28 32 165

-- * Violets

-- |![cobaltViolet](images/cobaltViolet.png)
cobaltViolet :: (Ord a, Floating a) => Colour a
cobaltViolet = sRGB24 159 66 146

-- |![ultramarine](images/ultramarine.png)
ultramarine :: (Ord a, Floating a) => Colour a
ultramarine = sRGB24 63 0 255

-- * Grays

-- |![ashGrey](images/ashGrey.png)
ashGrey :: (Ord a, Floating a) => Colour a
ashGrey = sRGB24 178 190 181

-- |![gris](images/gris.png)
gris :: (Ord a, Floating a) => Colour a
gris = sRGB24 152 152 152

-- |![cinerous](images/cinerous.png)
cinerous :: (Ord a, Floating a) => Colour a
cinerous = sRGB24 152 129 123

-- |![taupe](images/taupe.png)
taupe :: (Ord a, Floating a) => Colour a
taupe = sRGB24 72 60 50

-- |![jet](images/jet.png)
jet :: (Ord a, Floating a) => Colour a
jet = sRGB24 52 52 52
