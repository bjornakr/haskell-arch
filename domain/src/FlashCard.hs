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

newtype Rank = Rank Double

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
calculateWinStreak = undefined

rank :: UTCTime -> FlashCard -> Rank
rank _ (FlashCard _ _ []) = 0
rank currentTime (FlashCard _ _ attempts@((Attempt _ lastAttemptTime):_)) =
  let
    daysSinceLastVisited = diffDays lastAttemptTime currentTime
    visitedBonus = 1.0
    (WinStreak winStreakCount) = calculateWinStreak attempts
  in
    Rank $
      visitedBonus +
      daysSinceLastVisited -
      ((max 0.0 (winStreakCount - 3.0)) ** 2)

-- abstract case class CardStatistics(lastVisited: Option[ZonedDateTime], wins: Wins, losses: Losses, winStreak: WinStreak) {
--     def rating(now: ZonedDateTime): Int = {
--         val (visitedBonus, daysSinceLastVisited) = lastVisited match {
--             case None => (0, 0)
--             case Some(last) => (1, Period.between(last.toLocalDate, now.toLocalDate).getDays)
--         }

--         visitedBonus + daysSinceLastVisited - Math.pow(Math.max(0, winStreak.get - 3), 2).toInt
--     }
-- }
