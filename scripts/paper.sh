#!/bin/bash

DIR="~/Wallpaper-live"

FILE=$(ls "$DIR" | shuf -n 1)
mpvpaper -o "--video-zoom=0.15 --mute=yes" ALL "$DIR/$FILE"


