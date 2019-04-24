{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module Time where

import Data.Time

class (Monad m) => Ops m where
  now :: m UTCTime
