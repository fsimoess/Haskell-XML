{-# LANGUAGE TemplateHaskell #-}

module Main where

import Text.XML.HXQ.XQuery

main = do a <- $(xq "<result>{                                        \
                 \       for $x in doc('nota1.xml')//xMun             \
                 \       where $x = 'SANTA MARIA'                     \
                 \       return $x/../xBairro/text()                  \
                 \    }</result>                                      ")
          putXSeq a