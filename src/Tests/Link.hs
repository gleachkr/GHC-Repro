{-#LANGUAGE FlexibleInstances, MultiParamTypeClasses, GADTs, ScopedTypeVariables #-}

module Tests.Link(Flag, Link(..)) where

data Flag f g where Flag :: {checkFlag :: Bool} -> Flag f g deriving Show

class Link f g where flag :: Flag f g --False indicates that we don't have a link here

instance {-# OVERLAPPABLE #-} Link f f where flag = Flag True

instance {-# OVERLAPPABLE #-} Link f g where flag = Flag False

instance {-# OVERLAPPABLE #-} (Link f h, Link g h) => Link (f,g) h where
        flag = Flag $ checkFlag ((flag :: Flag f h)) || checkFlag ((flag :: Flag g h))
