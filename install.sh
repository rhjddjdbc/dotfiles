#! /bin/sh
chmod +x dependency.sh
chmod +x config.sh
chmod +x ascii/ps.sh
chmod +x ascii/tux.sh
chmod +x scripts/paper.sh
chmod +x scripts/po.sh
chmod +x scripts/sort.sh
./dependency.sh
./config.sh
mv ~/bashrc ~/.bashrc
mv ~/bash_if ~/.bash_if
mv ~/bash_aliases ~/.bash_aliases
mv ~/nerdfont.txt ~/.nerdfont.txt
