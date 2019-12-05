module UI.Views.Screens.Dashboard where

import Prelude 
import UI.Controllers.Screens.Dashboard 

import Effect (Effect)
import React.Basic (JSX, Self, createComponent, make, runUpdate)
import React.Basic.DOM as DOM

screen :: Props -> JSX
screen = make (createComponent "Dashboard") 
  { initialState
  , render
  }

send :: Self Props State -> Action -> Effect Unit
send = runUpdate update

render :: Self Props State -> JSX
render self@{ state } = DOM.text "DASHBOARD"
