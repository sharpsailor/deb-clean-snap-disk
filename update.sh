#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove && sudo apt-get autoclean
sudo apt-get clean
sudo rm -rf ~/.cache/thumbnails/*

#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
notify-send "cleanup is Complete!"
