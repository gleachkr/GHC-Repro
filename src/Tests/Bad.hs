{-# LANGUAGE TypeOperators #-}
module Tests.Bad where

import Tests.PrismLink

test = pflag :: Flag Bool ((A :|: A) B) (A B)
