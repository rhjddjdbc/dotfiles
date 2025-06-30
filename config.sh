#!/bin/bash

echo "cd in ~/dotfiles..."
cd ~/dotfiles || { echo "❌ Fehler: Verzeichnis ~/dotfiles nicht gefunden."; exit 1; }

echo "cp in to ~ ..."
/usr/bin/cp -av . ~/

echo  ":)"

