module Main where

import System.Environment
import Text.XML.HXT.Core
import Text.XML.HXT.XPath.Arrows 

main = do
  [src, dst] <- getArgs
  runX $
    readDocument [withValidate yes
                 ] src
    >>>
    root [] [ selem "result" [getXPathTrees "//xMun | //xBairro"] ]
    >>>
    writeDocument [withIndent yes
                  ,withOutputEncoding isoLatin1
                  ] dst
  return()