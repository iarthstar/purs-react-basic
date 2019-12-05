module UI.Accessors where

import Prelude

import Data.Newtype (class Newtype, unwrap, wrap)
import Optic.Lens (lens)
import Optic.Types (Lens')

-- | Example accessor
_acc :: forall a b c. Newtype a { acc :: b | c } => Lens' a b
_acc = lens (unwrap >>> _.acc) (\oldRec newVal -> wrap ((unwrap oldRec) { acc = newVal }))