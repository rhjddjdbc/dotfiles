#!/bin/bash

# Pomodoro timer using Kitty without distracting output

while true; do
    $TERM bash -c "echo '**Work now for 25 minutes!**'; sleep 5; exit" 2>/dev/null
    sleep 1500  # 25 minutes of work

    $TERM bash -c "echo '**Short break: relax for 5 minutes!**'; sleep 5; exit" 2>/dev/null
    sleep 300  # 5-minute break

    $TERM bash -c "echo '**Continue working for 25 minutes!**'; sleep 5; exit" 2>/dev/null
    sleep 1500  # 25 minutes of work

    $TERM bash -c "echo '**Longer break: relax for 10 minutes!**'; sleep 5; exit" 2>/dev/null
    sleep 600  # 10-minute break
done
