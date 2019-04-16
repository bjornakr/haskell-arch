module FlashCard.Internal.Common where

import qualified Data.Text as T
import Data.Time

newtype Front  = Front T.Text
newtype Back = Back T.Text

newtype LastVisit = LastVisit (Maybe UTCTime)

data Result = Win | Fail
data Attempt = Attempt Result UTCTime

data FlashCard = FlashCard Front Back [Attempt]

newtype Rank = Rank Int

newtype WinStreak = WinStreak Int

registerResult :: UTCTime -> Result -> FlashCard -> FlashCard
registerResult currentTime result (FlashCard f b attempts) =
  let
    attempt = Attempt result currentTime
  in
    FlashCard f b (attempt : attempts)
