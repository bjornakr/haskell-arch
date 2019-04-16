{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module InMemoryFlashCardStore (upsertFlashCard) where

import Control.Monad.State
import Data.IntMap
import FlashCard.Internal.Common
import FlashCardStore



instance FlashCardStore State (IntMap FlashCard) where
  save :: FlashCard -> State IntMap (CardId)
  save f = do
    intMap <- get
    let id = nextFreeKey intMap
    let newIntMap = insert id f intMap
    put newIntMap
    return $ CardId id

