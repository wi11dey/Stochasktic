{-# LANGUAGE UnicodeSyntax #-}
{-# LANGUAGE Arrows #-}

import Control.Arrow

data Integrated

(∫) :: ArrowLoop a ⇒ a Expression Integrated

blackScholes = proc w → do
  rec
    price ←(∫)⤙ price * (μ dataset * d t + σ dataset * d w)
  process ⤙ price
