module UI.Utils where

import Prelude
import UI.Types (Snackbar)

import Axios (class Axios, axios)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import React.Basic (JSX)
import React.Basic.DOM as DOM

foreign import showSnackbar :: Snackbar -> Effect Unit

foreign import showLoader :: Effect Unit
foreign import hideLoader :: Effect Unit

defaultSnackbar :: Snackbar
defaultSnackbar = 
  { message: "Something went wrong..."
  , timeout: 2750
  , actionHandler: Nothing
  , actionText: Nothing
  }

classy :: ({ className :: String, children :: Array JSX} -> JSX) -> String -> (Array JSX -> JSX)
classy element className children = element { className, children }

anchory :: String -> String -> String -> JSX
anchory className text href = DOM.a { className, href, children: [ DOM.text text ]}

callApiAndUpdateState :: forall t10 t11 t19 t20 t22 t28
  .  Axios t10 t11 
  => ({ state :: t19 | t20 } -> t28 -> Effect Unit )
  -> { state :: t19 | t20 } 
  -> (t22 -> t28) 
  -> t10 
  -> (t19 -> t11 -> t22) 
  -> Effect Unit
callApiAndUpdateState send self action config fn = do 
  showLoader
  launchAff_ do 
    axios config >>= liftEffect <<< case _ of
      Left err  -> showSnackbar defaultSnackbar
      Right res -> send self (action $ fn self.state res)
    liftEffect hideLoader