module UI.Types where

import Prelude

import Axios (class Axios, Method(..), defaultAxios)
import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe)
import Data.Newtype (class Newtype)
import Effect (Effect)
import Foreign.Generic (class Decode, class Encode, defaultOptions, genericDecode, genericEncode)


type Snackbar = 
  { message :: String
  , timeout :: Int
  , actionHandler :: Maybe (Unit -> Effect Unit)
  , actionText :: Maybe String
  }
