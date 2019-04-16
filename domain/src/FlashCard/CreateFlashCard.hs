module FlashCard.CreateFlashCard (
  createFront,
  createBack,
  createFlashCard,
) where

import Data.Time
import Data.Functor -- remove
import qualified Data.Text as T

newtype Front  = Front T.Text
newtype Back = Back T.Text

newtype LastVisit = LastVisit (Maybe UTCTime)

data Result = Win | Fail
data Attempt = Attempt Result UTCTime

data FlashCard = FlashCard Front Back [Attempt]

newtype Rank = Rank Int

newtype WinStreak = WinStreak Int

createFront :: T.Text -> Front
createFront txt = Front txt -- TODO: Validate

createBack :: T.Text -> Back
createBack txt = Back txt

createFlashCard :: Front -> Back -> FlashCard
createFlashCard f b = FlashCard f b []
