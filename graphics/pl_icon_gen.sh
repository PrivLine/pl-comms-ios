#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

echo $mydir
pushd "$mydir" > /dev/null

file="$1"

export_png_files_1x_2x() {
    newfile="$1"
    mdpi_w="$2"
    mdpi_h="$3"
    if [ -z "$mdpi_h" ]; then
        mdpi_h="$mdpi_w"
    fi
    convert "$file" -resize "$((mdpi_w*1))x$((mdpi_h*1))" "$base_folder/$newfile@1x.png"
    convert "$file" -resize "$((mdpi_w*2))x$((mdpi_h*2))" "$base_folder/$newfile@2x.png"
}

export_png_files_2x_3x() {
    newfile="$1"
    mdpi_w="$2"
    mdpi_h="$3"
    if [ -z "$mdpi_h" ]; then
        mdpi_h="$mdpi_w"
    fi
    convert "$file" -resize "$((mdpi_w*2))x$((mdpi_h*2))" "$base_folder/$newfile@2x.png"
    convert "$file" -resize "$((mdpi_w*3))x$((mdpi_h*3))" "$base_folder/$newfile@3x.png"
}

# Generate launch screen logo in ui-styles
base_folder="$mydir/../Riot/Assets/Images.xcassets/launch_screen_logo.imageset"
file="$mydir/privateline_logo_square.png"
convert "$file" -resize "240x240" "$base_folder/launch_screen_logo.png"
export_png_files_2x_3x "launch_screen_logo" 240 240


# Generate App Symbol in ui-styles
base_folder="$mydir/../Riot/Assets/Images.xcassets/Common/app_symbol.imageset"
file="$mydir/privateline_logo_square.png"
convert "$file" -resize "120x120" "$base_folder/Element Symbol.png"
export_png_files_2x_3x "Element Symbol" 120 120

# Generate launch AppIcon in Assets/SharedImages.xcassets/AppIcon.appiconset
base_folder="$mydir/../Riot/Assets/SharedImages.xcassets/AppIcon.appiconset"
file="$mydir/privateline_logo_square.png"
export_png_files_1x_2x "AppIcon~iPad-20" 20
export_png_files_1x_2x "AppIcon~iPad-29" 29
export_png_files_1x_2x "AppIcon~iPad-40" 40
export_png_files_1x_2x "AppIcon~iPad-76" 76

convert "$file" -resize "167x167" "$base_folder/AppIcon~iPad-83.5@2x.png"

export_png_files_2x_3x "AppIcon~iPhone-20" 20
export_png_files_2x_3x "AppIcon~iPhone-29" 29
export_png_files_2x_3x "AppIcon~iPhone-40" 40
export_png_files_2x_3x "AppIcon~iPhone-60" 60

convert "$file" -resize "1024x1024" "$base_folder/AppIcon~iOS-Marketing-1024@1x.png"


# Generate launch Horizontal AppIcon in Assets/SharedImages.xcassets/AppIcon.appiconset
base_folder="$mydir/../Riot/Assets/SharedImages.xcassets/horizontal_logo.imageset"
file="$mydir/horizontal_logo.png"
export_png_files_1x_2x "horizontal_logo" 210 120
export_png_files_2x_3x "horizontal_logo" 210 120