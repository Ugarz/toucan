#!/bin/sh
echo "----------------------------"
echo "--- Le process commence ----"
echo "----------------------------"

THEME_NAME='beaver'
ROOT_DIRECTORY="$(pwd)"
echo $ROOT_DIRECTORY

# Import variables
source $(dirname $0)/variables.sh
source $(dirname $0)/wp_install.sh
# source $(dirname $0)/copy-theme.sh

echo "----------------------------"
echo "--------- Terminé ----------"
echo "----------------------------"