{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module RegisterWinDef where

import qualified Time
import qualified FlashCardStore as Store

newtype CardId = CardId Int deriving (Eq, Show)

class Ops where
  apply :: (Monad m, Time.Ops m, Store.FlashCardStore m) => CardId -> m ()
