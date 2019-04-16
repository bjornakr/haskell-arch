{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module RegisterWinDef where

newtype CardId = CardId Int deriving (Eq, Show)

class Ops where
  apply :: CardId -> ()
