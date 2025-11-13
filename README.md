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
│   │   │   └── theme.conf
│   │   ├── userprefs.conf       # Personal preferences
│   │   └── windowrules.conf     # Window behavior
│   └── wlogout/
│       └── layout_1             # Logout menu layout
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

# Link theme switcher
ln -sf ~/.dotfiles/local/share/bin/themeswitch.sh ~/.local/share/bin/themeswitch.sh
chmod +x ~/.local/share/bin/themeswitch.sh

# For Neovim: See docs/astronvim-guide.md
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
