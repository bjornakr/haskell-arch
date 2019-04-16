{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

-- This is postfixed "Def" because ?
module CreateFlashCardDef where

import qualified Data.Text as T

-- data CreateCardError = DatabaseError T.Text

newtype CardId = CardId Int deriving (Eq, Show)
newtype Side = Side T.Text deriving (Eq, Show)
newtype Front = Front T.Text deriving (Eq, Show)
newtype Back = Back T.Text deriving (Eq, Show)
data CardInput = CardInput Front Back deriving (Eq, Show)

class Ops where
  apply :: CardInput -> IO CardId
