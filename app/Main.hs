{-# OPTIONS_GHC -Wall #-}
{-# OPTIONS_GHC -Wcompat #-}
{-# OPTIONS_GHC -Wincomplete-record-updates #-}
{-# OPTIONS_GHC -Wincomplete-uni-patterns #-}
{-# OPTIONS_GHC -Wredundant-constraints #-}
{-# OPTIONS_GHC -XMultiParamTypeClasses #-}
module Main where

import qualified CreateFlashCard
import qualified Console

main :: IO ()
main = do
    putStrLn "Welcome!"
    Console.main
