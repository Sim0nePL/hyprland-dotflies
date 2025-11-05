#!/bin/sh
wallpapersPath=$HOME/Pictures/Wallpapers
transition="--transition-type grow --transition-pos 0.85,0.95 --transition-step 80 --transition-duration 2"

monitor=$(hyprctl monitors -j | jq -r '.[].name' | wofi --dmenu --conf ~/.config/wofi/Monitors/monitors.conf)
if [ -z "$monitor" ]; then
    exit -1
fi
#echo $monitor

wallpaper=$(for img in $(ls $wallpapersPath); do
  echo -e "img:$wallpapersPath/$img:text:$img"
done | wofi --dmenu --conf ~/.config/wofi/Wallpapers/wallpapers.conf | sed 's/.*text://')

#echo $wallpaper
if [ -z "$wallpaper" ]; then
    exit -1
fi
#echo $wallpaper
# 
swww img $wallpapersPath/$wallpaper -o $monitor $transition
