{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module Time where

import Data.Time

class Ops where
  now :: IO UTCTime
