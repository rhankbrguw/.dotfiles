<div align="center">

# .dotfiles

**Production-grade development environment configuration**

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?style=flat-square&logo=neovim&logoColor=white)](https://neovim.io/)
[![Hyprland](https://img.shields.io/badge/Hyprland-Wayland-58E1FF?style=flat-square&logo=wayland&logoColor=black)](https://hyprland.org/)
[![Fedora](https://img.shields.io/badge/Fedora-40+-51A2DA?style=flat-square&logo=fedora&logoColor=white)](https://fedoraproject.org/)
[![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square)](LICENSE)

</div>

---

## Overview

A curated collection of configuration files optimized for full-stack development workflows. This setup provides a complete development environment with integrated tooling for modern application development across multiple technology stacks.

**Key Technologies:**
- **Editor:** Neovim with AstroNvim framework
- **Window Manager:** Hyprland (Wayland compositor)
- **Platform:** Fedora Linux 40+

## Architecture

### Editor Stack
- **Core:** [AstroNvim](https://github.com/AstroNvim/AstroNvim) - Extensible Neovim distribution
- **LSP:** Native Language Server Protocol integration
- **Completion:** Blink.cmp with intelligent suggestions
- **Fuzzy Finding:** Snacks Picker for rapid file navigation
- **Version Control:** Gitsigns + Lazygit integration
- **Syntax:** Tree-sitter for accurate parsing

### Desktop Environment
- **Compositor:** [Hyprland](https://github.com/Senshi111/fedora-hyprland-hyprdots) - Dynamic tiling Wayland compositor
- **Display Manager:** SDDM with custom theming
- **Status Bar:** Waybar with modular widgets
- **Launcher:** Rofi with Wayland support
- **Notifications:** Dunst notification daemon
- **Terminal:** Kitty with GPU acceleration

## Installation

### Prerequisites

Ensure the following are installed on your system:

```bash
# System requirements
- Fedora 40+ (for Hyprland setup)
- Neovim 0.10.0 or later
- Git 2.40+
- Node.js 20+ LTS
- Go 1.21+
- PHP 8.2+
- Dart SDK 3.0+
```

### Neovim Configuration

```bash
# Backup existing configuration
mv ~/.config/nvim{,.backup.$(date +%Y%m%d)}
mv ~/.local/share/nvim{,.backup.$(date +%Y%m%d)}

# Clone repository
git clone https://github.com/rhankbrguw/.dotfiles.git ~/dotfiles

# Create symbolic link
ln -sf ~/dotfiles/nvim ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

### Hyprland Environment (Fedora)

```bash
# Navigate to Hyprland configuration
cd ~/dotfiles/hyprland

# Execute installation script
chmod +x install_all.sh
./install_all.sh

# Post-installation
sudo systemctl reboot
```

## Configuration

### Language Server Setup

Install required LSP servers via Mason:

```vim
:MasonInstall typescript-language-server intelephense gopls
```

### Tree-sitter Parsers

```vim
:TSInstall javascript typescript php go dart dockerfile json yaml
```

### Theme Configuration

Available themes for both Neovim and Hyprland:
- Catppuccin (Mocha/Latte)
- Tokyo Night
- Rosé Pine
- Gruvbox
- Material Sakura

## Documentation

| Resource | Description |
|:---------|:------------|
| [Neovim Guide](./docs/neovim.md) | Comprehensive keybindings and usage patterns |
| [Hyprland Setup](./docs/hyprland.md) | Window management and customization |
| [Development Workflows](./docs/workflows.md) | Language-specific configurations |

## Technology Stack

### Development Languages
| Language | LSP Server | Formatter | Linter |
|:---------|:-----------|:----------|:-------|
| **JavaScript/TypeScript** | typescript-language-server | Prettier | ESLint |
| **PHP** | Intelephense | PHP-CS-Fixer | PHPStan |
| **Go** | gopls | gofumpt | golangci-lint |
| **Dart** | dart-language-server | dart format | dart analyze |

### System Components
| Component | Tool | Purpose |
|:----------|:-----|:--------|
| **Audio** | PipeWire + WirePlumber | Audio/video server |
| **Network** | NetworkManager | Connection management |
| **Bluetooth** | BlueZ + Blueman | Device connectivity |
| **Display** | SDDM | Session management |
| **Clipboard** | cliphist | Clipboard history |

## Features

### Neovim Capabilities
- ✅ Full LSP integration with auto-completion
- ✅ Intelligent code navigation (go-to-definition, find-references)
- ✅ Built-in debugging support (DAP protocol)
- ✅ Git workflow integration
- ✅ Project-wide search and replace
- ✅ Syntax-aware editing with Tree-sitter
- ✅ Auto-formatting on save
- ✅ Terminal multiplexing

### Hyprland Features
- ✅ Dynamic tiling with intelligent window placement
- ✅ Per-monitor workspace management
- ✅ Hardware-accelerated rendering
- ✅ Multi-monitor support with mixed refresh rates
- ✅ Custom animations and effects
- ✅ Theming system with live reload
- ✅ Screen sharing support (XDG Desktop Portal)

## Performance

Optimized for:
- Low latency input handling (<16ms)
- Minimal startup time (~300ms for Neovim)
- Efficient memory usage
- GPU-accelerated rendering where applicable

## Acknowledgments

This configuration builds upon the outstanding work of:

- **[AstroNvim Team](https://github.com/AstroNvim/AstroNvim)** - Comprehensive Neovim framework
- **[Senshi111](https://github.com/Senshi111/fedora-hyprland-hyprdots)** - Fedora Hyprland implementation
- **[prasanthrangan](https://github.com/prasanthrangan/hyprdots)** - Original Hyprdots theme collection

## Contributing

Contributions are welcome. Please ensure:
- Code follows existing style conventions
- Commits are atomic and well-described
- Documentation is updated accordingly

```bash
# Fork and clone
git clone https://github.com/yourusername/.dotfiles.git
cd .dotfiles

# Create feature branch
git checkout -b feature/your-feature

# Commit changes
git commit -m "feat: add feature description"

# Push and create PR
git push origin feature/your-feature
```

## Support

For issues or questions:
- Open an issue on [GitHub](https://github.com/rhankbrguw/.dotfiles/issues)
- Check existing documentation
- Review upstream project documentation

## License

This configuration is provided as-is under the MIT License. See [LICENSE](LICENSE) for details.

Individual components retain their original licenses:
- [AstroNvim License](https://github.com/AstroNvim/AstroNvim/blob/main/LICENSE)
- [Hyprdots License](https://github.com/prasanthrangan/hyprdots/blob/main/LICENSE)

---
