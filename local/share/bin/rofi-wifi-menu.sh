#!/bin/bash

# Rofi wifi menu with nmcli
notify-send "WiFi" "Scanning networks..." -i network-wireless

# Get wifi list
wifi_list=$(nmcli -f SSID,SECURITY device wifi list | tail -n +2 | sed 's/^  *//;s/  */ | /g')

# Get current connection status
connected=$(nmcli -t -f WIFI g)
if [[ "$connected" == "enabled" ]]; then
    toggle="󰖪  Disable WiFi"
else
    toggle="󰖩  Enable WiFi"
fi

# Show rofi menu
chosen=$(echo -e "$toggle\n$wifi_list" | rofi -dmenu -i -p "WiFi: " -theme ~/.config/rofi/selector-list.rasi)

# Exit if nothing selected
[ -z "$chosen" ] && exit

# Handle toggle
if [ "$chosen" = "󰖩  Enable WiFi" ]; then
    nmcli radio wifi on
    notify-send "WiFi" "WiFi enabled" -i network-wireless
    exit
elif [ "$chosen" = "󰖪  Disable WiFi" ]; then
    nmcli radio wifi off
    notify-send "WiFi" "WiFi disabled" -i network-wireless
    exit
fi

# Extract SSID (before |)
ssid=$(echo "$chosen" | cut -d'|' -f1 | xargs)

# Check if already saved
if nmcli -g NAME connection show | grep -q "^$ssid$"; then
    nmcli connection up "$ssid" && notify-send "WiFi" "Connected to $ssid" -i network-wireless
else
    # Ask password
    password=$(rofi -dmenu -password -p "Password for $ssid: " -theme ~/.config/rofi/selector-list.rasi)
    [ -z "$password" ] && exit
    nmcli device wifi connect "$ssid" password "$password" && notify-send "WiFi" "Connected to $ssid" -i network-wireless
fi
