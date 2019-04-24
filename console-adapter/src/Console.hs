module Console where
import System.IO
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import qualified Data.Text.Read as TR

import qualified Time

import qualified CreateFlashCardDef as Create
import qualified RegisterWinDef as RegisterWin

putTextLn str = TIO.putStrLn $ T.pack str

create :: (Create.Ops) => IO ()
create = do
  putTextLn "Create card:"
  putTextLn "Front: "
  front <- TIO.getLine
  putTextLn "Back: "
  back <- TIO.getLine
  let input = Create.CardInput (Create.Front front) (Create.Back back)
  cardId <- Create.apply input
  putTextLn $ "Created: " <> (show cardId)
  pure ()

registerWin :: (Time.Ops IO, RegisterWin.Ops) => IO ()
registerWin = do
  putTextLn "Register win for id: "
  id <- TIO.getLine
  let idi = fromRight 0 (fmap (_1) TR.decimal id)
  RegisterWin.apply (RegisterWin.CardId idi)
  putTextLn "Done"
  pure ()


main :: (Create.Ops) => IO ()
main =
  let loop = do
        getLine
        create
        loop
  in do
    hSetBuffering stdout NoBuffering
    hSetBuffering stdin NoBuffering
    loop

