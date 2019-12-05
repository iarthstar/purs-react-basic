module UI.Controllers.Screens.Home where

import Prelude 

import Effect (Effect)
import React.Basic (Self, StateUpdate(..), runUpdate)

send :: Self Props State -> Action -> Effect Unit
send = runUpdate update

type Props = Unit

type State = Unit

initialState :: State
initialState = unit

data Action
  = Noop
  | LoadState State

update :: Self Props State -> Action -> StateUpdate Props State
update self@{ state } = case _ of
  LoadState st -> Update st
  _ -> NoUpdate
