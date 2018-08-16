{-# LANGUAGE ScopedTypeVariables,OverloadedStrings #-}

-- The following code was shamelessly stolen from here:
-- http://blog.markwatson.com/2014/07/some-haskell-hacks-sparql-queries-to.html

-- My goal is to get something, anything, running in SQARQL, this will help me
-- just get my foot in the door. Next I will work on understanding what is
-- happening and achieving something more original.

-- Incidentally, the author of this blog, Mark Watson, seems like a pretty
-- legit fellow.

import Database.HSparql.Connection
import Database.HSparql.QueryGenerator

import Data.RDF hiding (triple)
import Data.RDF.TriplesGraph

simpleDescribe :: Query DescribeQuery
simpleDescribe = do
    resource <- prefix "dbpedia" (iriRef "http://dbpedia.org/resource/")
    uri <- describeIRI (resource .:. "Sedona_Arizona")
    return DescribeQuery { queryDescribe = uri }
    

doit = do
  (rdfGraph:: TriplesGraph) <- describeQuery "http://dbpedia.org/sparql" simpleDescribe
  --mapM_ print (triplesOf rdfGraph)
  --print "\n\n\n"
  --print rdfGraph
  mapM (\(Triple s p o) -> 
          case [s,p,o] of
            [UNode(s), UNode(p), UNode(o)] -> return (s,p,o)
            [UNode(s), UNode(p), LNode(PlainLL o2 l)] -> return (s,p,o2)
            [UNode(s), UNode(p), LNode(TypedL o2 l)] -> return (s,p,o2)
            _ -> return ("no match","no match","no match"))

    (triplesOf rdfGraph)

          
main = do
  results <- doit
  print $ results !! 0
  mapM_ print results
