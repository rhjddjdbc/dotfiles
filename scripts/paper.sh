#!/bin/bash

# Verzeichnis mit den Dateien
DIR="/home/sascha/Wallpaper-live"

# Zufällige Datei aus dem Verzeichnis wählen
FILE=$(ls "$DIR" | shuf -n 1)

# mpvpaper mit der zufällig gewählten Datei starten
mpvpaper -o "--video-zoom=0.15 --mute=yes" ALL "$DIR/$FILE"


