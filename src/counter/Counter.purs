module App.Counter (mkCounter) where

import Prelude

import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks (Component, component, useState, (/\))
import React.Basic.Hooks as React

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
              { className: "counter__container"
              , children:
                  [ R.button
                      { className: "counter__button"
                      , children: [ R.text "+" ]
                      , onClick: handler_ do
                          setCount \state -> { count: state.count + 1 }
                      }
                  , R.button
                      { className: "counter__button"
                      , children: [ R.text "-" ]
                      , onClick: handler_ do
                          setCount \state -> { count: state.count - 1 }
                      }
                  ]
              }
          ]
      }