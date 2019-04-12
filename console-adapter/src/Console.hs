module Console where
import System.IO
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

import qualified CreateFlashCardDef as Create

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

