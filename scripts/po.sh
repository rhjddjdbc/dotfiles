#!/bin/bash

# Pomodoro-Timer mit Kitty ohne störende Ausgabe

while true; do
    $TERM bash -c "echo '🚀 **Arbeite jetzt für 25 Minuten!**'; sleep 5; exit" 2>/dev/null
    sleep 1500  # 25 Minuten Arbeiten

    $TERM bash -c "echo '☕ **Kurze Pause: 5 Minuten entspannen!**'; sleep 5; exit" 2>/dev/null
    sleep 300  # 5 Minuten Pause

    $TERM bash -c "echo '🚀 **Weiterarbeiten für 25 Minuten!**'; sleep 5; exit" 2>/dev/null
    sleep 1500  # 25 Minuten Arbeiten

    $TERM bash -c "echo '🌿 **Längere Pause: 10 Minuten entspannen!**'; sleep 5; exit" 2>/dev/null
    sleep 600  # 10 Minuten Pause
done

