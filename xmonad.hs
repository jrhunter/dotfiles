import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
--import qualified XMonad.Layout.Tabbed as Tab

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig

import XMonad.Actions.UpdatePointer
import XMonad.Actions.GridSelect

import System.IO

--Below is needed for clickable workspaces in dzen:
--import Data.List

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/jrh/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook         = manageDocks <+> myManageHook
                        	<+> manageHook defaultConfig
        , layoutHook         = mylayoutHook 
        , logHook            = dynamicLogWithPP xmobarPP
                        	{ ppOutput = hPutStrLn xmproc
                      		, ppTitle  = xmobarColor "#cb4b16" "" . shorten 40
                                }
				>> updatePointer (Relative 0.5 0.5)
        , modMask            = mod4Mask 
	, normalBorderColor  = "#444444"
	, focusedBorderColor = "#005577"
        , terminal           = myTerminal 
	, workspaces         = myWorkspaces
--	, startupHook        = myStartupHook 
	} `removeKeys`
	[ (mod4Mask, xK_p)
	] `additionalKeys`
        [ 
          ((0, xK_Print),    spawn "scrot")
    	, ((mod4Mask, xK_p), spawn "dmenu_run -b -fn -*-terminus-bold-r-normal-*-22-*-*-*-*-*-*-* -nb '#002b36' -nf '#657b83' -sb '#b58900' -sf '#002b36'")
        , ((mod4Mask, xK_b), sendMessage   ToggleStruts)
	    , ((mod4Mask, xK_g), goToSelected  defaultGSConfig)
    	, ((mod4Mask, xK_s), spawnSelected defaultGSConfig ["emacs","sakura","gvim","gedit","iceweasel","chromium","luakit","urxvtcd","conky","gksu synaptic","gnome-system-monitor","thunar","xmonad --restart"])
	]

mylayoutHook = avoidStruts $ smartBorders 
    $ spiral (6/7) 
    ||| customTiled
--  ||| Tab.simpleTabbed
    ||| Grid

customTiled = Tall nmaster delta ratio
        where
            nmaster = 1
            ratio   = 1/2
            delta   = 3/100

myManageHook = composeAll
    [ isFullscreen           --> doFullFloat 
    , className =? "Gimp"    --> doFloat
    , className =? "Icedove" --> doFloat
    , className =? "orage" --> doFloat
    ]

myTerminal = "urxvtc"

myWorkspaces :: [WorkspaceId] 
myWorkspaces = [ "term", "mail", "web", "edit", "docs", "media", "etc", "bg", "play" ]

--myStartupHook :: X ()
--myStartupHook = do
--		spawn "redshift -x ; killall redshift ; redshift -l 40.2:74.5 -t 5000:3000 -m randr"
--		spawn "XMonadOnAcerDisplay"
