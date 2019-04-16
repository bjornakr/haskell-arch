module FlashCard (
  createFront,
  createBack,
  createFlashCard,
) where

import Data.Time
import Data.Functor -- remove
import qualified Data.Text as T

newtype Front  = Front T.Text
newtype Back = Back T.Text

-- newtype Views = Views Int
-- newtype Fails = Fails Int
-- newtype Wins = Wins Int

-- instance Functor Wins where
--   fmap f (Wins i) = f i

newtype LastVisit = LastVisit (Maybe UTCTime)

-- data Statistics = Statistics Fails Wins LastVisit

data Result = Win | Fail
data Attempt = Attempt Result UTCTime

data FlashCard = FlashCard Front Back [Attempt] -- Attempts should be a sorted list of some kind

newtype Rank = Rank Int

newtype WinStreak = WinStreak Int

-- increaseWins :: Wins -> Wins
-- increaseWins (Wins x) = Wins (x + 1)

-- increaseFails :: Fails -> Fails
-- increaseFails (Fails x) = Fails (x + 1)

createFront :: T.Text -> Front
createFront txt = Front txt

createBack :: T.Text -> Back
createBack txt = Back txt

createFlashCard :: Front -> Back -> FlashCard
createFlashCard f b = FlashCard f b []

registerResult :: UTCTime -> Result -> FlashCard -> FlashCard
registerResult currentTime result (FlashCard f b attempts) =
  let
    attempt = Attempt result currentTime
  in
    FlashCard f b (attempt : attempts)

calculateWinStreak :: [Attempt] -> WinStreak
calculateWinStreak as =
  let
    loop [] winCount = WinStreak winCount
    loop ((Attempt Fail _):_) winCount = WinStreak winCount
    loop ((Attempt Win _):as) winCount = loop as (winCount + 1)
  in
    loop as 0

rank :: UTCTime -> FlashCard -> Rank
rank _ (FlashCard _ _ []) = Rank 0
rank currentTime (FlashCard _ _ attempts@((Attempt _ lastAttemptTime):_)) =
  let
    daysSinceLastVisit = diffDays (utctDay lastAttemptTime) (utctDay currentTime)
    touchedBonus = 1
    (WinStreak winStreakCount) = calculateWinStreak attempts
  in
    Rank $
      touchedBonus +
      (fromIntegral daysSinceLastVisit) - ((max 0 (winStreakCount - 3)) ^ 2)
