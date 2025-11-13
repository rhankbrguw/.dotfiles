<div align="center">

# .dotfiles

**Personal development environment configuration**

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-58E1FF?style=flat-square&logo=wayland&logoColor=black)](https://hyprland.org/)
[![Fedora](https://img.shields.io/badge/Fedora-42-51A2DA?style=flat-square&logo=fedora&logoColor=white)](https://fedoraproject.org/)

</div>

---

## 📁 Repository Structure

```
.dotfiles/
├── config/
│   ├── hypr/                    # Hyprland compositor configuration
│   │   ├── animations.conf      # Animation settings
│   │   ├── hyprland.conf        # Main config
│   │   ├── hyprlock.conf        # Lock screen
│   │   ├── keybindings.conf     # Keyboard shortcuts
│   │   ├── monitors.conf        # Display setup
│   │   ├── themes/              # Theme system
│   │   │   ├── colors.conf
│   │   │   ├── common.conf
│   │   │   ├── theme/           # 10 pre-configured themes
│   │   │   │   ├── Catppucin-Latte.conf
│   │   │   │   ├── Catppucin-Mocha.conf
│   │   │   │   ├── Cyberpunk-Edge.conf
│   │   │   │   ├── Decay-Green.conf
│   │   │   │   ├── Frosted-Glass.conf
│   │   │   │   ├── Graphite-Mono.conf
│   │   │   │   ├── Gruvbox-Retro.conf
│   │   │   │   ├── Material-Sakura.conf
│   │   │   │   ├── Rose-Pine.conf
│   │   │   │   └── Tokyo-Night.conf
│   │   │   └── theme.conf
│   │   ├── userprefs.conf       # Personal preferences
│   │   └── windowrules.conf     # Window behavior
│   ├── nvim/                    # Neovim configuration
│   │   ├── init.lua             # Entry point
│   │   ├── lazy-lock.json       # Plugin versions
│   │   ├── lua/
│   │   │   ├── community.lua
│   │   │   ├── lazy_setup.lua
│   │   │   ├── plugins/         # Plugin configurations
│   │   │   │   ├── astrocore.lua
│   │   │   │   ├── astrolsp.lua
│   │   │   │   ├── astroui.lua
│   │   │   │   ├── mason.lua
│   │   │   │   ├── none-ls.lua
│   │   │   │   ├── treesitter.lua
│   │   │   │   └── user.lua
│   │   │   └── polish.lua
│   │   ├── neovim.yml
│   │   └── selene.toml
│   ├── waybar/                  # Status bar configuration
│   │   ├── config.ctl
│   │   ├── config.jsonc         # Main config
│   │   ├── modules/             # Waybar modules
│   │   │   ├── backlight.jsonc
│   │   │   ├── battrey.jsonc
│   │   │   ├── bluetooth.jsonc
│   │   │   ├── cliphist.jsonc
│   │   │   ├── clock.jsonc
│   │   │   ├── cpu.jsonc
│   │   │   ├── footer.jsonc
│   │   │   ├── gpuinfo.jsonc
│   │   │   ├── header.jsonc
│   │   │   ├── idle_inhibitor.jsonc
│   │   │   ├── keybindhint.jsonc
│   │   │   ├── language.jsonc
│   │   │   ├── mediaplayer.py
│   │   │   ├── memory.jsonc
│   │   │   ├── mode.jsonc
│   │   │   ├── mpris.jsonc
│   │   │   ├── network.jsonc
│   │   │   ├── notifications.jsonc
│   │   │   ├── power.jsonc
│   │   │   ├── pulseaudio.jsonc
│   │   │   ├── spotify.jsonc
│   │   │   ├── style.css
│   │   │   ├── taskbar.jsonc
│   │   │   ├── theme.jsonc
│   │   │   ├── tray.jsonc
│   │   │   ├── updates.jsonc
│   │   │   ├── wallchange.jsonc
│   │   │   ├── wbar.jsonc
│   │   │   ├── window.jsonc
│   │   │   └── workspaces.jsonc
│   │   ├── style.css
│   │   └── theme.css
│   └── wlogout/                 # Logout menu
│       ├── icons/               # System action icons
│       │   ├── hibernate_black.png
│       │   ├── hibernate_dark.png
│       │   ├── hibernate_light.png
│       │   ├── hibernate_white.png
│       │   ├── lock_black.png
│       │   ├── lock_dark.png
│       │   ├── lock_light.png
│       │   ├── lock_white.png
│       │   ├── logout_black.png
│       │   ├── logout_dark.png
│       │   ├── logout_light.png
│       │   ├── logout_white.png
│       │   ├── reboot_black.png
│       │   ├── reboot_dark.png
│       │   ├── reboot_light.png
│       │   ├── reboot_white.png
│       │   ├── shutdown_black.png
│       │   ├── shutdown_dark.png
│       │   ├── shutdown_light.png
│       │   ├── shutdown_white.png
│       │   ├── suspend_black.png
│       │   ├── suspend_dark.png
│       │   ├── suspend_light.png
│       │   └── suspend_white.png
│       ├── layout_1
│       ├── layout_2
│       ├── style_1.css
│       └── style_2.css
├── docs/
│   ├── astronvim-guide.md       # Neovim keybindings reference
│   └── hyprland-guide.md        # Hyprland keybindings reference
├── local/
│   └── share/
│       └── bin/
│           └── themeswitch.sh   # Theme switcher script
└── README.md
```

---

## 🚀 Quick Setup

```bash
# Clone repository
git clone git@github.com:rhankbrguw/.dotfiles.git ~/.dotfiles

# Link Hyprland config
ln -sf ~/.dotfiles/config/hypr ~/.config/hypr
ln -sf ~/.dotfiles/config/wlogout ~/.config/wlogout

# Link Waybar config
ln -sf ~/.dotfiles/config/waybar ~/.config/waybar

# Link Neovim config
ln -sf ~/.dotfiles/config/nvim ~/.config/nvim

# Link theme switcher
ln -sf ~/.dotfiles/local/share/bin/themeswitch.sh ~/.local/share/bin/themeswitch.sh
chmod +x ~/.local/share/bin/themeswitch.sh
```

---

## 🛠️ Tech Stack

| Category       | Tools                                            |
| -------------- | ------------------------------------------------ |
| **Editor**     | Neovim (AstroNvim)                               |
| **LSP**        | TypeScript, PHP (Intelephense), Go (gopls), Dart |
| **Compositor** | Hyprland (Wayland)                               |
| **Terminal**   | Kitty                                            |
| **Bar**        | Waybar                                           |
| **Launcher**   | Rofi                                             |

---

## 📖 Documentation

- **Neovim keybindings:** [`docs/astronvim-guide.md`](docs/astronvim-guide.md)
- **Hyprland keybindings:** [`docs/hyprland-guide.md`](docs/hyprland-guide.md)

---

## 🎨 Available Themes

1. Catppuccin Latte
2. Catppuccin Mocha
3. Cyberpunk Edge
4. Decay Green
5. Frosted Glass
6. Graphite Mono
7. Gruvbox Retro
8. Material Sakura
9. Rose Pine
10. Tokyo Night

**Switch themes:** Run `themeswitch.sh` or use configured keybind.

---

## 🙏 Credits

- **[AstroNvim](https://github.com/AstroNvim/AstroNvim)** - Neovim framework
- **[Senshi111](https://github.com/Senshi111/fedora-hyprland-hyprdots)** - Fedora Hyprland base
- **[prasanthrangan](https://github.com/prasanthrangan/hyprdots)** - Original Hyprdots themes

---

## 📄 License

MIT License - Configuration files provided as-is for reference.
