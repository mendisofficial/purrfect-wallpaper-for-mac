#!/bin/bash

# Directory to save the downloaded wallpaper
WALLPAPER_DIR="$HOME/Wallpapers"
mkdir -p "$WALLPAPER_DIR"

# Set your desired width and height
WIDTH=2560
HEIGHT=1600

# Download a random cat wallpaper with specific dimensions
IMAGE_URL=$(curl -s "https://api.thecatapi.com/v1/images/search?size=full&width=$WIDTH&height=$HEIGHT" | jq -r '.[0].url')
IMAGE_PATH="$WALLPAPER_DIR/cat_wallpaper.jpg"
curl -s -o "$IMAGE_PATH" "$IMAGE_URL"

# Add a small delay to ensure the image is fully downloaded
sleep 1

# Change the wallpaper using AppleScript
osascript -e "
tell application \"System Events\"
    tell every desktop
        set picture to \"$IMAGE_PATH\"
    end tell
end tell"