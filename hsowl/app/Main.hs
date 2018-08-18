{-# LANGUAGE OverloadedStrings #-}

module Main where

import Hsowl

import qualified System.Environment as SE
import qualified Data.Text as DT

import Database.HSparql.Connection
import Database.HSparql.QueryGenerator

testQuery :: Query SelectQuery
testQuery = do
    foaf <- prefix "foaf" (iriRef "http://xmlns.com/foaf/0.1/")
    owl  <- prefix "owl"  (iriRef "http://www.w3.org/2002/07/owl#")
    rdfs <- prefix "rdfs" (iriRef "http://www.w3.org/2000/01/rdf-schema#")
    xsd  <- prefix "xsd"  (iriRef "http://www.w3.org/2001/XMLSchema#")
    rdf  <- prefix "rdf"  (iriRef "http://www.w3.org/1999/02/22-rdf-syntax-ns#")
    f    <- prefix "f"    (iriRef "http://example.com/owl/families/")

    s <- var
    p <- var
    o <- var

    triple_ s (f .:. "hasFather") o

    selectVars [s, o]

doit :: EndPoint -> IO ()
doit ep = do
  (Just result) <- selectQuery ep testQuery
  putStrLn . show $ result

main :: IO ()
main = do
  args <- SE.getArgs
  case args of
    -- no input
    []  -> putStrLn "You must provide at least one argument"

    [endpoint] -> doit endpoint
