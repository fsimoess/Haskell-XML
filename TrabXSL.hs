{-# LANGUAGE Arrows, PackageImports #-} 

import System.Environment ( getArgs )
import System.Exit (exitSuccess, exitWith, ExitCode(..))
import Control.Arrow
import "hxt" Text.XML.HXT.Core 
import "hxt" Text.XML.HXT.DOM.XmlKeywords 
import "hxt-xslt" Text.XML.HXT.XSLT.XsltArrows
import "hxt" Text.XML.HXT.Arrow.XmlState.TraceHandling (withTraceLevel)

process :: String -> String -> IO ([String])
process xslStylesheetPath xmlDocPath = do

    -- compile stylesheet

    compiledStyleSheetResults <- runX $ 
        arr (const xslStylesheetPath) 
        >>> readXSLTDoc [ withValidate yes, withInputEncoding utf8]   -- withTrace 2 
        >>> {- withTraceLevel 2 -} xsltCompileStylesheet

    case compiledStyleSheetResults of
         [] -> return ["error compiling " ++ xslStylesheetPath] 
         compiledStyleSheet : _ -> do

             -- apply compiled stylesheet to xml doc 
             
             runX $ arr (const xmlDocPath) 
                 >>> readXSLTDoc [ withValidate yes, withInputEncoding utf8] -- withTrace 2
                 >>> xsltApplyStylesheet compiledStyleSheet
                 >>> writeDocumentToString [withOutputEncoding utf8, 
                                            withXmlPi yes, withIndent yes]

readXSLTDoc :: SysConfigList -> IOSArrow String XmlTree
readXSLTDoc options
    = readFromDocument (options ++ defaultOptions)
    where
    defaultOptions
        = [ withCheckNamespaces yes
          , withValidate        no
          , withPreserveComment no
          ]         

main = do
 args <- getArgs
 case args of 
   [arg1, arg2] -> do
       results <- process arg1 arg2
       case results of
            [] -> putStrLn "errors"
            result : _ -> putStrLn result

       exitSuccess