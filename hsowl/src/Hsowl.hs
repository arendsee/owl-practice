{-# LANGUAGE OverloadedStrings #-}

module Hsowl ( someFunc ) where

import Database.HSparql.Connection
import Database.HSparql.QueryGenerator

someFunc :: IO ()
someFunc = putStrLn "someFunc"
