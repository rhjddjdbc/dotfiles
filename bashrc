# -------------
# bash settings
# -------------
set -o vi
shopt -s autocd
shopt -s cdspell
shopt -s histappend

# ----------
# eval "$()"
# ----------
# Starship initialisieren
eval "$(starship init bash)"
# Aktiviere zoxide
eval "$(zoxide init bash)"
#thefuck
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# -----------------
# poke, rick & time
# -----------------
if [ $((RANDOM % 2)) -eq 0 ]; then
    ~/venvs/ricksay-env/bin/ricksay

else
    ~/.cargo/bin/krabby random
fi
date

# ------
# ble.sh
# ------
[[ $- == *i* ]] &&
  source "$HOME/.local/share/blesh/ble.sh" --attach=none

[[ ${BLE_VERSION-} ]] && ble-attach

# ---------------------
# Verlaufseinstellungen
# ---------------------
HISTSIZE=100000
SAVEHIST=100000
export VISUAL=nvim
export EDITOR=nvim
export TERM=kitty

# ------------------------------
# exa - Color Scheme Definitions
# ------------------------------
export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

# ---------------
# manpage Dracula
# ---------------
export MANPAGER="/usr/bin/less -s -M +Gg"
export LESS_TERMCAP_mb=$'\e[1;31m'      # begin bold
export LESS_TERMCAP_md=$'\e[1;34m'      # begin blink
export LESS_TERMCAP_so=$'\e[01;45;37m'  # begin reverse video
export LESS_TERMCAP_us=$'\e[01;36m'     # begin underline
export LESS_TERMCAP_me=$'\e[0m'         # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'         # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'         # reset underline
export GROFF_NO_SGR=1                   # für konsole
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# ---------------
# bash alias & if
# ---------------
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_if ]; then
    source ~/.bash_if
fi

# ---
# fzf
# ---
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash


# -----
# debug
# -----
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$HOME/.local/bin:$PATH

# -----
# cargo
# -----
export PATH="$HOME/.cargo/bin:$PATH"



