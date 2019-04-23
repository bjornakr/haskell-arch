{-# OPTIONS_GHC -XMultiParamTypeClasses #-}
{-# OPTIONS_GHC -XInstanceSigs #-}

module InMemoryFlashCardStore where

import Control.Monad.State
import Data.IntMap
import FlashCard.Internal.Common
import qualified FlashCardStore as Def
import Data.IORef



instance Def.FlashCardStore Maybe where
  save :: FlashCard -> Maybe Def.CardId
  save = undefined

-- instance Def.FlashCardStore State IntMap where
--   save :: FlashCard -> State (IntMap FlashCard) Def.CardId
--   save f = do
--     intMap <- get
--     let id = nextFreeKey intMap
--     let newIntMap = insert id f intMap
--     put newIntMap
--     return $ CardId id

