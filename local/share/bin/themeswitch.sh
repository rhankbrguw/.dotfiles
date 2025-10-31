#!/bin/bash

# Initialize script variables and validate theme detection
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"
[ -z "${hydeTheme}" ] && echo "ERROR: unable to detect theme" && exit 1
get_themes


# Function definitions
Theme_Change()
{
    local x_switch=$1
    for i in ${!thmList[@]} ; do
        if [ "${thmList[i]}" == "${hydeTheme}" ] ; then
            if [ "${x_switch}" == 'n' ] ; then
                setIndex=$(( (i + 1) % ${#thmList[@]} ))
            elif [ "${x_switch}" == 'p' ] ; then
                setIndex=$(( i - 1 ))
            fi
            themeSet="${thmList[setIndex]}"
            break
        fi
    done
}


# Parse command-line options
while getopts "nps:" option ; do
    case $option in
    n ) # Set next theme
        Theme_Change n
        export xtrans="grow" ;;
    p ) # Set previous theme
        Theme_Change p
        export xtrans="outer" ;;
    s ) # Set selected theme
        themeSet="$OPTARG" ;;
    * ) # Invalid option
        echo "... invalid option ..."
        exit 1 ;;
    esac
done


# Validate theme exists in available themes list
if ! $(echo "${thmList[@]}" | grep -wq "${themeSet}") ; then
    echo "ERROR: theme ${themeSet} not found"
    exit 1
fi

echo ":: applying theme :: \"${themeSet}\""

# Update configuration file with selected theme
set_conf "hydeTheme" "${themeSet}"


# =============================================================================
# Theme Configuration Data
# =============================================================================
# Centralized theme configuration replacing legacy .conf file approach
case "${themeSet}" in
    "Catppuccin-Latte")
        gtkTheme="Catppuccin-Latte"
        iconTheme="Tela-circle-grey"
        colorScheme="prefer-light"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Catppuccin-Mocha")
        gtkTheme="Catppuccin-Mocha"
        iconTheme="Tela-circle-dracula"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Cyberpunk-Edge")
        gtkTheme="Cyberpunk-Edge"
        iconTheme="Tela-circle-yellow"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Decay-Green")
        gtkTheme="Decay-Green"
        iconTheme="Tela-circle-green"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Frosted-Glass")
        gtkTheme="Frosted-Glass"
        iconTheme="Tela-circle-blue"
        colorScheme="prefer-light"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Graphite-Mono")
        gtkTheme="Graphite-Mono"
        iconTheme="Tela-circle-grey"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Gruvbox-Retro")
        gtkTheme="Gruvbox-Retro"
        iconTheme="Gruvbox-Plus-Dark"
        colorScheme="prefer-dark"
        cursorTheme="Gruvbox-Retro" # Theme-specific cursor
        ;;
    "Material-Sakura")
        gtkTheme="Material-Sakura"
        iconTheme="Tela-circle-black"
        colorScheme="prefer-light"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Rose-Pine")
        gtkTheme="Rose-Pine"
        iconTheme="Tela-circle-pink"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    "Tokyo-Night")
        gtkTheme="Tokyo-Night"
        iconTheme="Tela-circle-purple"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
    *) # Default fallback configuration
        gtkTheme="Fedora"
        iconTheme="Fedora"
        colorScheme="prefer-dark"
        cursorTheme="Bibata-Modern-Ice"
        ;;
esac
# =============================================================================
# End of Theme Configuration Data
# =============================================================================


# Apply all theme settings concurrently for improved performance

# Configure Hyprland cursor
hyprctl setcursor "${cursorTheme}" 20 &

# Configure GTK, icon, color scheme, and cursor themes via gsettings
gsettings set org.gnome.desktop.interface gtk-theme "${gtkTheme}" &
gsettings set org.gnome.desktop.interface icon-theme "${iconTheme}" &
gsettings set org.gnome.desktop.interface color-scheme "${colorScheme}" &
gsettings set org.gnome.desktop.interface cursor-theme "${cursorTheme}" &
gsettings set org.gnome.desktop.interface cursor-size 20 &

# Configure system fonts (inherited from common.conf)
gsettings set org.gnome.desktop.interface font-name 'Cantarell 12' &
gsettings set org.gnome.desktop.interface document-font-name 'Cantarell 12' &
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaCove Nerd Font Mono 11' &

# Update Qt5/Qt6 configuration files
sed -i "/^icon_theme=/c\icon_theme=${iconTheme}" "${confDir}/qt5ct/qt5ct.conf" &
sed -i "/^icon_theme=/c\icon_theme=${iconTheme}" "${confDir}/qt6ct/qt6ct.conf" &

# Update GTK3 configuration file
sed -i "/^gtk-theme-name=/c\gtk-theme-name=${gtkTheme}" $confDir/gtk-3.0/settings.ini &
sed -i "/^gtk-icon-theme-name=/c\gtk-icon-theme-name=${iconTheme}" $confD/gtk-3.0/settings.ini &

# Configure GTK4 theme via symbolic link
if [ -d /run/current-system/sw/share/themes ] ; then
    themeDir=/run/current-system/sw/share/themes
else
    themeDir=~/.themes
fi
rm -rf "${confDir}/gtk-4.0"
ln -s "${themeDir}/${gtkTheme}/gtk-4.0" "${confDir}/gtk-4.0" &

# Configure Flatpak GTK theme environment variables
if pkg_installed flatpak ; then
    flatpak --user override --env=GTK_THEME="${gtkTheme}" &
    flatpak --user override --env=ICON_THEME="${iconTheme}" &
fi

# Update Hyprland theme configuration
# Copy the clean theme file to active configuration to prevent corruption
source "${scrDir}/globalcontrol.sh"
if [ -z "${themeFile}" ] ; then
    themeFile="${confDir}/hypr/themes/${themeSet}.conf"
fi
cp -f "${themeFile}" "${confDir}/hypr/themes/theme.conf"


# Apply wallpaper for selected theme
"${scrDir}/swwwallpaper.sh" -s "$(readlink "${hydeThemeDir}/wall.set")" &


# Wait for all background processes to complete
wait

# Reload Hyprland configuration
export reload_flag=1
source "${scrDir}/globalcontrol.sh"
