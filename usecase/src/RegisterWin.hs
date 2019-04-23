{-# OPTIONS_GHC -XMultiParamTypeClasses #-}
{-# OPTIONS_GHC -XInstanceSigs #-}

module RegisterWin where
  import qualified RegisterWinDef as Def
  import qualified FlashCard.RegisterWin as Domain
  import qualified FlashCardStore as Store
  import qualified Time as Time
  import FlashCard.Internal.Common

  instance Def.Ops where
    apply :: (Monad m, Time.Ops, Store.FlashCardStore m) => Def.CardId -> IO ()
    apply (Def.CardId i) = do
      let cardId = Store.CardId i -- common domain import?
      p <- pure ()
      card <- Store.get cardId
      timestamp <- Time.now
      let result = Domain.registerWin timestamp card
      pure ()
