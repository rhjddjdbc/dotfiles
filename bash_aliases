# ---------
# cd../exit
# ---------
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .5='cd ../../../../..'
alias q='exit'
alias :q='exit'

# ------
# system
# ------
alias sudo="doas"
alias update="yay -Syyu; flatpak update"
alias S="yay -S --noconfirm"
alias Ss="yay -Ss"
alias R="yay -R --noconfirm"
alias Rs="yay -Rss --noconfirm"
alias Qe="yay -Qe"
alias Qs="yay -Qs"
alias clean="doas pacman -Rns $(pacman -Qdtq); flatpak uninstall --unused && flatpak repair"
alias grub-update="doas grub-mkconfig -o /boot/grub/grub.cfg"
alias reboot="shutdown -r now"
alias coin='[ $((RANDOM % 2)) -eq 0 ] && echo "Heads" || echo "Tails"'

# ---------------------
# terminal & navigation
# ---------------------
alias cat="bat"
alias cd="z"
alias c="clear"
alias h="htop"
alias meminfo="free -h"
alias df="dysk -a --ascii"
alias fetch="hyfetch"
alias md='mkdir -pv'
alias rd='rmdir'
alias grep='grep --color=auto'
alias y="yazi"
alias mv="pymv"
alias cp="pycp"
alias rm="rm -iv"
alias ln="ln -i"
alias rr="rm -ivr"
alias ka="killall -u $USER"
alias ls="exa -hl --icons"
alias todo="todo.sh"

# ----------------
# File Management
# ----------------
alias rmf="/usr/bin/fzf --preview 'cat {}' | xargs -r rm -r"
alias f="fzf"
alias fzf="fzf --preview 'bat --style=plain --color=always --line-range :500 {}' | wl-copy"

# -------
# network
# -------
alias pingg="ping gnu.org"
alias myip="curl https://api.ipify.org"
alias w3s="w3m www.duckduckgo.com"

# -----------------
# HTTrack aliases
# -----------------
alias htdl='httrack'  # Simple alias for HTTrack
alias htdlsite='httrack --mirror'  # Mirror a website
alias htdlresume='httrack --continue'  # Resume an interrupted download
alias htdlupdate='httrack --update'  # Update a mirrored site

# ---------
# programs
# ---------
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias dv="doas nvim"
alias iwtui="impala"
alias calen="calcure"
alias snap="btrbk"
alias news="newsboat"
alias yt3="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0"
alias bt="bluetoothctl"
alias btt="bluetui"
alias py='python3'
alias navi="navi > /dev/null 2>&1"
alias na="navi > /dev/null 2>&1"

# ---
# git
# ---
alias gs='git status'  # Show status
alias ga='git add .'  # Add all changes
alias gc='git commit -m'  # Quick commit with message
alias gp='git push origin main'  # Push to main branch
alias gco='git checkout'  # Switch branch
alias gundo='git reset --hard HEAD~1'  # Undo last commit
alias gdiff='git diff'  # Show file changes
alias gpull='git pull --rebase'  # Pull with rebase

alias gl='git log --oneline --graph --decorate --all'  # Graphical log view
alias ghist='git log --pretty=format:"%h %s [%an]" --graph'  # Compact log overview
alias gclean='git gc --prune=now'  # Clean up Git repo
alias gnew='git checkout -b'  # Create new branch
alias glast='git log -1 HEAD'  # Show last commit

alias gbr='git branch | /usr/bin/fzf | xargs git checkout'  # Interactive branch switch with FZF
alias gfile='git ls-files | /usr/bin/fzf | xargs git add'  # Select files interactively

# ------
# podman
# ------
alias docker='podman'  # Use Podman as Docker
alias p='podman'
alias ps='podman ps'  # Show running containers
alias pl='podman logs'  # Show container logs
alias pi='podman images'  # Show available images

alias pr='podman run -it --rm'  # Run temporary container
alias pb='podman build -t'  # Build container image
alias pstart='podman start'  # Start container
alias pstop='podman stop'  # Stop container
alias prem='podman rm -f'  # Remove container

alias podls='podman pod list'  # List all pods
alias podrm='podman pod rm -f'  # Remove pod
alias podstart='podman pod start'  # Start pod
alias podstop='podman pod stop'  # Stop pod

# ---
# gdb
# ---
alias gdbs='gdb -q'  # Start GDB quietly
alias gdbt='gdb -tui'  # Start GDB with TUI
alias gdbx='gdb --args'  # Start GDB with args

alias gdbb='gdb -ex "break main"'  # Set breakpoint at main
alias gdbr='gdb -ex "run"'  # Run program directly
alias gdbi='gdb -ex "info locals"'  # Show local variables
alias gdbv='gdb -ex "info variables"'  # Show all variables
alias gdbf='gdb -ex "frame"'  # Show current stack frame

alias gdbm='gdb -ex "info memory"'  # Show memory info
alias gdbr='gdb -ex "info registers"'  # Show registers
alias gdbs='gdb -ex "info sharedlibrary"'  # Show shared libraries

# ---
# USB
# ---
alias usbls='lsblk -o NAME,SIZE,FSTYPE,MOUNTPOINT'  # Show all USB devices
alias usbmount='sudo mount /dev/sdX /mnt/usb'  # Manually mount USB stick
alias usbunmount='sudo umount /mnt/usb'  # Safely unmount USB stick
alias usbformat='sudo mkfs.vfat -F32 /dev/sdX'  # Format USB stick as FAT32

alias usbauto='sudo mount $(lsblk -o NAME,MOUNTPOINT | grep -v MOUNTPOINT | awk "{print \"/dev/\" \$1}") /mnt/usb'

alias usbcopy='cp ~/Documents /mnt/usb'  # Copy documents to USB
alias usbbackup='rsync -av ~/importent /mnt/usb'  # Backup to USB stick
alias usbclean='rm -rf /mnt/usb/*' 

alias usbinfo='lsblk -o NAME,SIZE,FSTYPE,UUID,MOUNTPOINT'  
alias usbuuid='blkid | grep /dev/sdX' 
alias usb="udiskie --automount --no-notify > /dev/null 2>&1 & yazi /run/media/sascha"
alias ount="doas mount /dev/nvme1n1p1 /mnt/nvme"
alias unt="doas umount /mnt/nvme"

# -----
# chmod
# -----
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# --------------------
# Archive Aliases
# --------------------
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'

# ---------
# Checksums
# ---------
alias s1s='sha1sum'
alias s2s='sha256sum'
alias s5s='sha512sum'
alias m5s='md5sum'

alias s5h='sha512hmac'
alias s2h='sha256hmac'
alias s1h='sha1hmac'

# -----
# GnuPG
# -----
alias gpg-fingerprint='gpg --import --import-options show-only'
alias g-ver='gpg --verify'

# -------
# scripts
# -------
alias off="clear; ~/ascii/pc.sh; sleep 5 && shutdown -h now"
alias tux="~/ascii/tux.sh"
alias pomo="nohup ~/scripts/po.sh >/dev/null 2>&1 &"
alias icon="bat ~/.nerdfont.txt | /usr/bin/fzf --ansi --preview='echo {} | cut -d\" \" -f1' --preview-window=up:1 | awk '{print \$1}' | wl-copy"

# ---------
# rc/config
# ---------
alias bashrc="nvim ~/.bashrc"
alias
