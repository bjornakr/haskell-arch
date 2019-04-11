{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module CreateFlashCardDef where

import qualified Data.Text as T

data CreateCardError = DatabaseError T.Text

newtype CardId = CardId Int
newtype Side = Side T.Text
newtype Front = Front T.Text
newtype Back = Back T.Text
data CardInput = CardInput Front Back

class CreateFlashCardOps where
    createFlashCard :: CardInput -> IO CardId
