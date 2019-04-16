module RegisterWin where
  import qualified RegisterWinDef as Def
  import qualified FlashCard.RegisterWin as Domain

  instance Def.Ops where
    apply :: Def.CardId -> ()
    apply (Def.CardId i) = do
      let cardId = Domain.CardId i -- common domain import?
      card <- Store.getCard cardId
      timestamp <- createTimestamp
      pure $ Domain.registerWin timestamp card
