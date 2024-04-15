{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE Arrows #-}

import Control.Arrow

data DifferentialEquation exp var

instance ArrowLoop DifferentialEquation where
  loop f = 

data Integrated

data Time
t = Time

data Variable =
  Time |
  Wiener

data Expression =
  D Variable |
  Integrated Expression |
  Add Expression Expression |
  Multiply Expression Expression |
  Negate Expression |
  Reciprocal Expression

d = D
(∫) :: DifferentialEquation Expression Expression
(∫) = arr . Integrated
at :: Floating f ⇒ Integrated → f → f

blackScholes = proc w → do
  rec
    price ←(∫)⤙ price * (μ dataset * d t + σ dataset * d w)
  process ⤙ price
