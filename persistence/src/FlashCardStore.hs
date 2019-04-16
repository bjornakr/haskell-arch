{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module FlashCardStore where

import FlashCard.Internal.Common

data CardId = CardId Int

class Monad m => FlashCardStore m where
  save :: FlashCard -> m (CardId)
