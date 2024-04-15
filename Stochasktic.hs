{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE UnicodeSyntax #-}

import GHC.Records
import GHC.TypeLits

data DerivativeOf = DerivativeOf
d = DerivativeOf

instance HasField (variable :: Symbol) DerivativeOf Derivative

instance Floating Derivative

type Process = Floating t ⇒ t → t

(≡) :: Derivative → Expression → Process

s = d.s ≡ s*((μ dataset)*d.t + (σ dataset)*d.W)
