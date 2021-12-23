module Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import Effect.Random (randomInt)
import React.Basic.DOM (css, render)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, component, useState', (/\))
import React.Basic.Hooks as React
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

-- | Find the element with `app` id, that we declared in `index.html`.
-- | Create and render a component tree into this element,
-- | Or crash in case we messed up during the setup.
main :: Effect Unit
main = do
  doc <- document =<< window
  container <- getElementById "app" $ toNonElementParentNode doc
  randomBox <- mkRandomBox
  case container of
    Nothing -> throw "Could not find container element"
    Just c -> render (randomBox {}) c

-- | An effectful function that creates a react component without any props.
-- | Uses a State Hook to manage the position of the box.
mkRandomBox :: Component {}
mkRandomBox = do
  component "RandomBox" \_ -> React.do
    -- returns a stateful position, and a function to update it
    { x, y } /\ setPosition <- useState' { x: 100, y: 100 }
    -- renders a box at the {x, y} position with a button to change a position
    pure $ R.div
      { className: "box"
      , style: css
          { position: "absolute"
          , top: show x <> "px"
          , left: show y <> "px"
          }
      , children:
          [ R.div
              { className: "screen"
              }
          , R.button
              { className: "button"
              , children: [ R.text "Click me" ]
              , onClick: handler_ do
                  newX <- randomInt 100 500
                  newY <- randomInt 100 500
                  setPosition { x: newX, y: newY }
              }
          ]
      }