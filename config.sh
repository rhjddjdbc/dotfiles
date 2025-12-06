#!/bin/bash

echo "cd in ~/dotfiles..."
cd ~/dotfiles || { echo "~/dotfiles not files"; exit 1; }

echo "cp in to ~ ..."
/usr/bin/cp -av . ~/

echo  ":)"

