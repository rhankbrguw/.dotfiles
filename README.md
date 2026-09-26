# .dotfiles

Personal Wayland desktop environment for Fedora / Arch. Hyprland compositor with HyDE and Wallbash dynamic palette theming. Neovim configuration built on AstroNvim v4. Kitty terminal, Waybar status bar, Rofi launcher, and custom utility scripts.

---

Clone to `~/.dotfiles`, run `./bin/setup-dotfiles.sh` to symlink configs with automatic `.bak` backups.

Compositor: Hyprland with custom dwindle rules, animations, monitor profiles, and workspace bindings.

Status Bar: Waybar with custom modules for CPU/GPU telemetry, MPRIS playback, and network status.

Editor: Neovim with AstroNvim v4, Mason LSP manager, Treesitter syntax parsing, and Lua plugins.

Terminal: Kitty GPU-accelerated emulator synchronized with active color themes.

Theming: HyDE and Wallbash for wallpaper-driven 16-color palette generation across GTK, Kitty, Rofi, and Waybar.

Shortcuts: Check `docs/hyprland-guide.md` for full desktop keybindings.

Editor Docs: Check `docs/astronvim-guide.md` for Neovim mappings.

---

Requires Hyprland, Waybar, Kitty, Neovim 0.9+, Rofi-wayland, and Wallbash/HyDE toolchain.
