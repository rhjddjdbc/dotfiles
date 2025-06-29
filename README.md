# creadits
### https://github.com/addy-dclxvi/i3-starterpack
### https://github.com/jameswylde/wypr-hyprland
### https://github.com/sameemul-haque/dotfiles
### https://github.com/dracula
### https://github.com/prbhtkumr/rofi-radio

## pic 
![Screenshot](screenshot-1750861747.png)

# Welcome to my custom Linux setup: fast, stylish, keyboard-centric, and dark-themed. These dotfiles configure a complete Wayland workflow with **SwayFX**, **Foot**, **Kitty**, **Neovim**, **Bash**, and more—wrapped in a unified **Dracula color scheme**.

---

## ✦ Window Manager: SwayFX

A sleek Wayland tiling setup with **SwayFX** (fork of Sway) enabling blur, rounded corners, and vibrancy.

### Features:
- Dracula-inspired window borders and bar colors
- Autostart of key apps: `kitty`, `yazi`, `qutebrowser`, `waybar`, `mako`, etc.
- Scratchpad support with `$mod+Shift+-` and `$mod+-`
- Workspace pinning for apps (e.g. browser to workspace 2)
- Floating rules for media/image/archive apps
- Input tweaks:
  - German keyboard layout with CapsLock → Escape
  - Natural scrolling and tap-to-click for touchpads
- Multimedia key support (volume, brightness, mic mute)

---

## ✦ Status Bar: Waybar

Customized **Waybar** with Dracula colors. Modules include:
- Clock
- Battery
- Audio
- Network

---

## ✦ Application Launcher: Rofi

Rofi is styled with Dracula theme:
- App launching
- Custom scripts (e.g. `rofi-radio`, `pass-menu`)

---

## ✦ Terminal Emulators: Kitty & Foot

- **Kitty**: used in tiling windows and workspace 1  
- **Foot**: lightweight alternative, also themed in Dracula

Both have:
- Transparent backgrounds
- Dracula color palette
- Vi keybindings (where applicable)

---

## ✦ Code Editor: Neovim

Full-fledged **Neovim IDE** configuration (Lua-based) with:
- Dracula colorscheme (`dracula.nvim`)
- Plugin management via `packer.nvim`
- LSP: `mason.nvim`, `nvim-lspconfig`
- Fuzzy finding: `telescope.nvim`
- Git: `neogit`, `diffview`
- UI: `alpha-nvim`, `lualine.nvim`, `devicons`, `dressing.nvim`
- Debugging: `nvim-dap` with LLDB, GDB, debugpy
- Markdown: live preview, Vimwiki integration
- AI: local `ollama.nvim` (model at `localhost:11434`)

---

## ✦ File Manager: Yazi

Modern terminal file manager with:
- Vim-style navigation
- Dracula-colored icons and previews
- Auto mount and open USB with `usb` alias

---

## ✦ Newsfeed: Newsboat

Text-based feed reader with:
- Dracula-styled color configuration
- Fetches tech/dev/RSS feeds at boot

---

## ✦ Browser: Qutebrowser

Minimal, keyboard-first browser with:
- Dracula stylesheet and color hints
- Custom keybindings and start page
- Configured for workspace 3 in SwayFX

---

## ✦ Bash Shell

Supercharged Bash setup with:
- Vi-mode (`set -o vi`)
- Enhanced navigation: `zoxide`, `thefuck`, `ble.sh`
- Auto greetings (`ricksay`, `krabby`)
- USB utilities (`usbmount`, `usbinfo`, etc.)
- Git shortcuts, Podman wrappers, clipboard helpers, translation tools

### Notable Aliases:
- `run`, `convert`, `ex`, `yt3`, `ont`, `rmf`
- `cd=z`, `md`, `rd`, `ls=exa`, `cat=bat`
- Git: `gs`, `ga`, `gp`, `gco`, `gclean`, `gl`, `gfile`
- `docker` command mapped to Podman

---

## ✦ Wlogout Integration

Used for Rofi and Waybar power menus:
- Logout, shutdown, reboot, suspend

---

## ✦ Custom Scripts

### `paper.sh`
Randomly sets a video wallpaper using `mpvpaper`:

### sort.sh
Organizes documents, pictures, code, and downloads by file extension:
