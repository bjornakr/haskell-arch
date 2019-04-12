module FlashCard (createFront, createBack, createFlashCard) where

import Data.Time
import qualified Data.Text as T

newtype Front  = Front T.Text
newtype Back = Back T.Text

-- newtype Views = Views Int
newtype Fails = Fails Int
newtype Wins = Wins Int
newtype LastVisit = LastVisit (Maybe UTCTime)

data Statistics = Statistics Fails Wins LastVisit

data FlashCard = FlashCard Front Back Statistics

createFront :: T.Text -> Front
createFront txt = Front txt

createBack :: T.Text -> Back
createBack txt = Back txt

createFlashCard :: Front -> Back -> FlashCard
createFlashCard f b =
  let
    initStats = Statistics (Fails 0) (Wins 0) (LastVisit Nothing) in
  FlashCard f b initStats
