{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module CreateFlashCard where
  import qualified CreateFlashCardDef as Dto
  import qualified FlashCard as FC

  import qualified Data.Text as T

  instance Dto.Ops where
      apply (Dto.CardInput (Dto.Front frontText) (Dto.Back backText)) = do
        let front = FC.createFront frontText
        let back = FC.createBack backText
        let card = FC.createFlashCard front back
        pure $ Dto.CardId 1
