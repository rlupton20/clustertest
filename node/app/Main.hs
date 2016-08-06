module Main where

import Control.Concurrent (threadDelay)
import Control.Monad (forever)
import System.IO (hPutStrLn, stderr)


main :: IO ()
main = forever $ do
  hPutStrLn stderr "Hello World"
  threadDelay 10000000
