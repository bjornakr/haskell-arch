module Console where
import CreateFlashCardDef


create :: (CreateFlashCardOps) => IO ()
create = do
    _ <- putStrLn "Create card:"
    _ <- putStr "Front: "
    front <- readLn
    _ <- putStr "Back: "
    back <- readLn
    let input = CardInput (Front front) (Back back)
    cardId <- createFlashCard input
    pure ()



loop :: (CreateFlashCardOps) => IO ()
loop = do
    _ <- (readLn::IO String)
    create
    loop