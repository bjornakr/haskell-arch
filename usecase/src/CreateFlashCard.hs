{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module CreateFlashCard where
  import qualified CreateFlashCardDef as Def
  import qualified FlashCard

  import qualified Data.Text as T

  instance Def.Ops where
      apply (CardInput (Front frontText) (Back backText)) = do
        let front = Flashcard.createFront frontText
        let back = Flashcard.createBack backText
        let card = FlashCard.createCard front back
        pure $ CardId 1
