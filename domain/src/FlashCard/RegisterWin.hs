module FlashCard.RegisterWin (registerWin) where

import Data.Time
import FlashCard.Internal.Common

registerWin :: UTCTime -> FlashCard -> FlashCard
registerWin currentTime f =
  registerResult currentTime Win f
