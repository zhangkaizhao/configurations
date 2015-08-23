{-# LANGUAGE OverloadedStrings #-}

import Yi

import qualified Yi.Keymap.Vim        as V2
import qualified Yi.Keymap.Vim.Common as V2
import qualified Yi.Keymap.Vim.Utils  as V2

import           Yi.Keymap.Vim.StateUtils (getCountE)

import           Data.Monoid ((<>), mappend)

main = yi $ myConfig

myConfig = defaultVimConfig
  { defaultKm = myKeymap
  , configUI  = (configUI defaultVimConfig) { configWindowFill = '~' }
  }

myKeymap = v2KeymapSet $ myBindings

myBindings :: (V2.EventString -> EditorM ()) -> [V2.VimBinding]
myBindings eval =
  [ nmap  (leader "<C-a>") (getCountE >>= withCurrentBuffer . savingPointB . incrementNextNumberByB)
  , nmap  (leader "<C-x>") (getCountE >>= withCurrentBuffer . savingPointB . incrementNextNumberByB . negate)
  ]

-- Boilerplate begins here
v2KeymapSet :: ((V2.EventString -> EditorM ()) -> [V2.VimBinding]) -> KeymapSet
v2KeymapSet myBindings = V2.mkKeymapSet $ V2.defVimConfig `override` \super this ->
    let eval = V2.pureEval this
    in super {
          V2.vimBindings = myBindings eval <> V2.vimBindings super
        }

nmap  x y = V2.mkStringBindingE V2.Normal V2.Drop (x, y, id)
imap  x y = V2.VimBindingE (\evs state -> case V2.vsMode state of
                            V2.Insert _ ->
                                fmap (const (y >> return V2.Continue))
                                     (evs `V2.matchesString` x)
                            _ -> V2.NoMatch)
nmap'  x y = V2.mkStringBindingY V2.Normal (x, y, id)

leader :: V2.EventString -> V2.EventString
leader = mappend "\\"
--Boilerplate ends here
