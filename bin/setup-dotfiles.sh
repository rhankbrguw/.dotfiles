#!/bin/bash

# ========================================
# Safe Dotfiles Symlink Setup with Backup
# ========================================

set -e  # Hentikan jika ada error

DOTFILES="$HOME/.dotfiles"

declare -A LINKS
LINKS=(
    ["$DOTFILES/config/hypr"]="$HOME/.config/hypr"
    ["$DOTFILES/config/waybar"]="$HOME/.config/waybar"
    ["$DOTFILES/config/nvim"]="$HOME/.config/nvim"
    ["$DOTFILES/config/wlogout"]="$HOME/.config/wlogout"
    ["$DOTFILES/local/share/bin/themeswitch.sh"]="$HOME/.local/share/bin/themeswitch.sh"
    ["$DOTFILES/config/rofi"]="$HOME/.config/rofi"
    ["$DOTFILES/local/share/bin/rofi-wifi-menu.sh"]="$HOME/.local/share/bin/rofi-wifi-menu.sh"
)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Memulai setup symlink dotfiles...${NC}"
echo

safe_link() {
    local src="$1"
    local dest="$2"
    local backup="${dest}.bak"

    if [ ! -e "$src" ]; then
        echo -e "${RED}Error: Source tidak ditemukan: $src${NC}"
        return 1
    fi

    if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
        echo -e "${YELLOW}Sudah terhubung: $dest${NC}"
        return 0
    fi

    if [ -e "$dest" ] && [ ! -e "$backup" ]; then
        echo -e "${YELLOW}Backup: $dest → $backup${NC}"
        mv "$dest" "$backup"
    elif [ -e "$backup" ]; then
        echo -e "${YELLOW}Backup sudah ada: $backup (skip backup)${NC}"
    fi

    mkdir -p "$(dirname "$dest")"

    echo -e "${GREEN}Symlink: $src → $dest${NC}"
    ln -sf "$src" "$dest"

    [[ "$dest" == *.sh ]] && chmod +x "$dest"
}

for src in "${!LINKS[@]}"; do
    safe_link "$src" "${LINKS[$src]}"
done

echo
echo -e "${GREEN}Setup Finished!${NC}"
echo -e "${YELLOW}Backup has been saved (bak.)${NC}"
echo -e "If you wanna check: ${GREEN}ls -la ~/.config/ | grep bak${NC}"
