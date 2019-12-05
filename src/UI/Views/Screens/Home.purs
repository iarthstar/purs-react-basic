module UI.Views.Screens.Home where

import Prelude 
import UI.Controllers.Screens.Home 

import Effect (Effect)
import React.Basic (JSX, Self, createComponent, make, runUpdate)
import React.Basic.DOM as DOM

screen :: Props -> JSX
screen = make (createComponent "Home") 
  { initialState
  , render
  }

send :: Self Props State -> Action -> Effect Unit
send = runUpdate update

render :: Self Props State -> JSX
render self = DOM.text "HOME"