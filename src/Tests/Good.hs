{-# LANGUAGE TypeOperators #-}
module Tests.Good where

import Tests.PrismLink

test = pflag :: Flag Bool ((A :|: A) B) (A B)
