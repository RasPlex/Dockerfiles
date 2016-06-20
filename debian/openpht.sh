#!/bin/sh
PHTROOT=/usr/lib/openpht
export LD_LIBRARY_PATH=$PHTROOT/bin/system/players/dvdplayer:$LD_LIBRARY_PATH
export XBMC_HOME=$PHTROOT/share/XBMC
$PHTROOT/bin/plexhometheater
