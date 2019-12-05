module Main where

import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable)
import Prelude (Unit, unit, ($), (<$>))
import React.Basic (JSX, createComponent, element, make)
import React.Basic as React
import React.Basic.DOM as DOM
import React.Basic.Router (RouteProps)
import React.Basic.Router as Router
import UI.Utils (classy)
import UI.Views.Screens.Dashboard as Dashboard
import UI.Views.Screens.Home as Home

type Self = React.Self Props State

type Props = Unit

type State = Unit

initialState :: State
initialState = unit

app :: Props -> JSX
app = make (createComponent "app") 
  { initialState
  , render 
  }

render :: Self -> JSX
render self@{ state } = React.fragment
  [ snackbar
  , element Router.switch { children: (element Router.route) <$> routes } 
  , loader
  ]

routes :: Array (RouteProps Unit)
routes = 
  [ { exact: true
    , path: toNullable $ Just "/dashboard"
    , render: Dashboard.screen
    }
  , { exact: true
    , path: toNullable Nothing
    , render: Home.screen
    }
  ]

loader :: JSX
loader = DOM.div
  { id: "loader"
  , style: DOM.css 
      { width: "100%"
      , height: "100%"
      , display: "none"
      , alignContent: "center"
      , position: "fixed"
      , backgroundColor: "#FFFFFFAA"
      , zIndex: "999" 
      }
  , children: 
    [ DOM.div 
      { className: "mdl-spinner mdl-spinner--single-color mdl-js-spinner is-active mx-auto"
      , style: DOM.css { top: "calc(50% - 14px)" }
      }
    ] 
  }

snackbar :: JSX
snackbar = DOM.div 
  { id: "snack-bar"
  , className: "mdl-js-snackbar mdl-snackbar"
  , children: 
    [ classy DOM.div "mdl-snackbar__text" []
    , classy DOM.button "mdl-snackbar__action" []
    ]
  }
