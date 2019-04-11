{-# OPTIONS_GHC -XMultiParamTypeClasses #-}

module CreateFlashCard where
    import CreateFlashCardDef

    instance CreateFlashCardOps where
        createFlashCard _ = pure $ CardId 1
