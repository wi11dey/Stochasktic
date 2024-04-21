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
  WienerProcess Int

class Inputs a where
  inputs :: a

instance Inputs (Variable) where
  inputs = (WienerProcess 0)

instance Inputs (Variable, Variable) where
  inputs = (WienerProcess 0, WienerProcess 1)

-- TODO tagless final arrow?

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

blackScholes = proc w:_ → do
  rec
    price ←(∫)⤙ price * (μ dataset * d t + σ dataset * d w)
  process ⤙ price

-- https://math.stackexchange.com/questions/1050770/how-to-solve-system-of-stochastic-differential-equations
example = proc w₁:w₂:_ → do
  rec
    n₁ ←(∫)⤙ (2*a - 1)*p*n₁*d t + α*n₁*d w₁
    n₂ ←(∫)⤙ (2*p*n₁ - μ*n₂)*d t + α₂*n₂*d w₂
  processes ⤙ [n₁, n₂]
