<div align="center">

# My .dotfiles

**Personal development environment configuration**

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-58E1FF?style=flat-square&logo=wayland&logoColor=black)](https://hyprland.org/)
[![Fedora](https://img.shields.io/badge/Fedora-40+-51A2DA?style=flat-square&logo=fedora&logoColor=white)](https://fedoraproject.org/)

</div>

---

## Overview

This repository contains my personal configuration files and documentation for Neovim and Hyprland on Fedora 40. These are reference materials and keybinding guides, not installation scripts.

**Contents:**
- Neovim configuration files
- Hyprland configuration files
- Documentation and keybinding references

## Structure

```
.dotfiles/
├── nvim/           # Neovim configuration
├── hyprland/       # Hyprland configuration
└── docs/           # Documentation and guides
    ├── neovim.md   # Neovim keybindings
    └── hyprland.md # Hyprland keybindings
```
## Technology Stack

### Editor
- **Neovim** with AstroNvim framework
- **LSP:** TypeScript, PHP (Intelephense), Go (gopls), Dart
- **Formatters:** Prettier, PHP-CS-Fixer, gofumpt
- **Terminal:** Kitty

### Desktop Environment
- **Compositor:** Hyprland (Wayland)
- **Status Bar:** Waybar
- **Launcher:** Rofi
- **Display Manager:** SDDM
- **Notifications:** Dunst

## Usage

These configurations are tailored for full-stack development with Laravel, React, Flutter, and Go.

To use these configurations:

```bash
# Clone repository
git clone https://github.com/rhankbrguw/.dotfiles.git

# Link configurations (backup yours first)
ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/hyprland ~/.config/hypr
```

## Acknowledgments

**Big thanks to the amazing developers whose work made this possible:**

### Neovim Configuration
- **[AstroNvim Team](https://github.com/AstroNvim)** - [@mehalter](https://github.com/mehalter) and contributors
  - Repository: [AstroNvim/AstroNvim](https://github.com/AstroNvim/AstroNvim)
  - An incredible Neovim configuration framework

### Hyprland Environment
- **[@Senshi111](https://github.com/Senshi111)** - Fedora Hyprland adaptation
  - Repository: [Senshi111/fedora-hyprland-hyprdots](https://github.com/Senshi111/fedora-hyprland-hyprdots)
  - Excellent Fedora-specific implementation

- **[@prasanthrangan](https://github.com/prasanthrangan)** - Original Hyprdots themes
  - Repository: [prasanthrangan/hyprdots](https://github.com/prasanthrangan/hyprdots)
  - Beautiful theme collection and configurations

## License

Configuration files are provided as-is for reference. Original projects retain their respective licenses.

---
