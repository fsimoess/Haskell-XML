{-# LANGUAGE TemplateHaskell #-}

module Main where

import System.Environment
import Text.XML.HXQ.XQuery

main :: IO ()
main = do
  [src, xqr] <- getArgs
  validateFile src xqr
  return ()