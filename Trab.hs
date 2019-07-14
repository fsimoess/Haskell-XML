module Main where
 
import System.Environment
import Text.XML.HXT.Core
import Text.XML.HXT.Curl
import Text.XML.HXT.XMLSchema.DataTypeLibW3CNames

main :: IO ()
main = do
  [src, dst] <- getArgs
  runX $
    readDocument [withValidate yes
                 ] src
    >>>
    writeDocument [withIndent yes
                  ,withOutputEncoding isoLatin1
                  ] dst
  return ()