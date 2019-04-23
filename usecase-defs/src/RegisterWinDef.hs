{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module RegisterWinDef where

import qualified Time

newtype CardId = CardId Int deriving (Eq, Show)

class Ops where
  apply :: (Time.Ops) => CardId -> IO ()
