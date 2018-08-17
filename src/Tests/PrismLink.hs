{-#LANGUAGE UndecidableInstances, FlexibleInstances, MultiParamTypeClasses, GADTs, PolyKinds, TypeOperators, ScopedTypeVariables #-}

module Tests.PrismLink(
  (:|:), Flag, PrismLink(..), A(..), B(..)
) where

data (:|:) :: (k -> k' -> *) -> (k -> k' -> *) -> k -> k' -> * where

data Flag a f g where
        Flag :: {checkFlag :: a} -> Flag a f g
    deriving (Show)

instance {-# OVERLAPPABLE #-} PrismLink f f where
        pflag = Flag True

instance PrismLink ((f :|: g) idx) ((f :|: g) idx) where
        pflag = Flag True

class PrismLink f g where
        pflag :: Flag Bool f g --const False indicates that we don't have a prism here

instance {-# OVERLAPPABLE #-} PrismLink f g where
        pflag = Flag False

instance {-# OVERLAPPABLE #-} (PrismLink (f idx) h, PrismLink (g idx) h) => PrismLink ((f :|: g) idx) h where
        pflag = Flag $ checkFlag ((pflag :: Flag Bool (f idx) h)) || checkFlag ((pflag :: Flag Bool (g idx) h))

data A :: (* -> *) -> * -> * where

data B :: (* -> *)
