#!/bin/sh

#  correct_string.sh
#  Privateline
#
#  Created by Thomaz on 3/3/24.
#  Copyright © 2024 Thomaz. All rights reserved.

set -e

mydir="$(dirname "$(realpath "$0")")"

echo $mydir

pushd "$mydir" > /dev/null

configdir="$mydir/Config"

# Element -> PL Comms
find "$configdir" -name *.xcconfig -exec \
    sed -i '' -e  's|Element|PL Comms|g' '{}' \;

find "$configdir" -name *.xcconfig -exec \
    sed -i '' -e  's|element|pl-comms|g' '{}' \;

find "$configdir" -name *.xcconfig -exec \
    sed -i '' -e  's|im\.vector|dev\.privateline|g' '{}' \;

find "$configdir" -name *.xcconfig -exec \
    sed -i '' -e  's|Vector|Privateline|g' '{}' \;
    
find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|element\.io|privateline\.dev|g' '{}' \;
    
# matrix.org -> mtxnode1.privateline.dev
find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|matrix\.org|mtxnode1\.privateline\.dev|g' '{}' \;
    
find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|vector\.im|mtxnode1\.privateline\.dev|g' '{}' \;
    
find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|riot\.im|mtxnode1\.privateline\.dev|g' '{}' \;
    
find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|riot-ios|pl-comms-ios|g' '{}' \;

find "$configdir" -name BuildSettings.swift -exec \
    sed -i '' -e  's|element-auto-uisi|pl-comms-auto-uisi|g' '{}' \;

# change color #0DBD8B -> #368BD6 (DesignKit)
find "$mydir" -name *.swift -exec \
    sed -i '' -e  's|0DBD8B|368BD6|g' '{}' \;

# change fastlane info
fastlanedir="$mydir/fastlane"

find "$fastlanedir" -name .env.default -exec \
    sed -i '' -e  's|im\.vector|dev\.privateline|g' '{}' \;

find "$fastlanedir" -name .env.default -exec \
    sed -i '' -e  's|Vector|Privateline|g' '{}' \;
    
# change string info (Element -> PL Comms)
riotaccetsdir="$mydir/Riot/Assets"

find "$riotaccetsdir" -name .env.default -exec \
    sed -i '' -e  's|Element|dev\.privateline|g' '{}' \;

find "$riotaccetsdir" -name .env.default -exec \
    sed -i '' -e  's|Vector|PL Comms|g' '{}' \;

find "$riotaccetsdir" -name *.strings -exec \
    sed -i '' -e  's|Element|PL Comms|g' '{}' \;

find "$riotaccetsdir" -name *.strings -exec \
    sed -i '' -e  's|Matrix|PL-Mtx|g' '{}' \;

find "$riotaccetsdir" -name *.strings -exec \
    sed -i '' -e  's|matrix\.org|mtxnode1\.privateline\.dev|g' '{}' \;
    
find "$mydir" -name CHANGES.md -exec \
    sed -i '' -e  's|Element|PL Comms|g' '{}' \;
    
find "$mydir" -name README.md -exec \
    sed -i '' -e  's|Element|PL Comms|g' '{}' \;
    
# change Riot/SupportingFiles/Riot.entitlements
riotentitlementsdir="$mydir/Riot/SupportingFiles/Riot.entitlements"
find "$riotentitlementsdir" -name Riot.entitlements -exec \
    sed -i '' -e  's|vector\.im|mtxnode1\.privateline\.dev|g' '{}' \;

find "$riotentitlementsdir" -name Riot.entitlements -exec \
    sed -i '' -e  's|riot\.im|mtxnode1\.privateline\.dev|g' '{}' \;

find "$riotentitlementsdir" -name Riot.entitlements -exec \
    sed -i '' -e  's|element\.io|privateline\.dev|g' '{}' \;

popd > /dev/null

echo "Seems like language is up-to-date :)"
