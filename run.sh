#!/bin/sh

export LD_LIBRARY_PATH=$PWD/usr/lib:$LD_LIBRARY_PATH
export QT_QUICK_CONTROLS_MOBILE=true
export QT_QUICK_CONTROLS_STYLE=Material

exec $PWD/usr/bin/qmlcreator \
    --desktop_file_hint=${HOME}/.local/share/applications/${APP_ID}.desktop "$@"
