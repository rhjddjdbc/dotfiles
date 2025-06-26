#!/bin/bash

echo "📁 Wechsle in ~/dotfiles..."
cd ~/dotfiles || { echo "❌ Fehler: Verzeichnis ~/dotfiles nicht gefunden."; exit 1; }

echo "🔁 Kopiere alle Dateien nach ~ ..."
/usr/bin/cp -av . ~/

echo "✅ Dotfiles erfolgreich nach ~ kopiert."

