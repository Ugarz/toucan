#!/usr/bin
echo "Copying theme to wordpress theme directory..."
rsync -a $CREVETTE_DIRECTORY $THEMES_DIRECTORY
echo "Theme copied !"