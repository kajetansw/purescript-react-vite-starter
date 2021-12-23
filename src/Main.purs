module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import React.Basic.DOM (render)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, component, useState, (/\))
import React.Basic.Hooks as React
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

main :: Effect Unit
main = do
  doc <- document =<< window
  container <- getElementById "app" $ toNonElementParentNode doc
  counter <- mkCounter
  case container of
    Nothing -> throw "Could not find container element"
    Just c -> render (counter {}) c

mkCounter :: Component {}
mkCounter = do
  component "Counter" \_ -> React.do
    -- returns a tuple of current state and a setter function
    -- initial state is passed as an argument
    { count } /\ setCount <- useState { count: 0 }
    -- renders a div with counter and two buttons
    pure $ R.div
      { children:
          [ R.text $ "Count: " <> show count
          , R.div
              { className: "container"
              , children:
                  [ R.button
                      { className: "button"
                      , children: [ R.text "+" ]
                      , onClick: handler_ do
                          setCount \state -> { count: state.count + 1 }
                      }
                  , R.button
                      { className: "button"
                      , children: [ R.text "-" ]
                      , onClick: handler_ do
                          setCount \state -> { count: state.count - 1 }
                      }
                  ]
              }
          ]
      }