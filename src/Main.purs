module Main where

import Prelude

import App.Counter (mkCounter)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM.Client (createRoot, renderRoot)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  doc <- document =<< window
  root <- getElementById "app" $ toNonElementParentNode doc
  counter <- mkCounter
  case root of
    Nothing -> throw "Could not find container element"
    Just container -> do
      reactRoot <- createRoot container
      renderRoot reactRoot (counter {})
