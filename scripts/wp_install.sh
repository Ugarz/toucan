#!/bin/bash
echo "$(pwd)"
clear
customVersion="5.0.2"
lastestWp=""
finalVersion=""
wordpressPath="$( cd "$(dirname "$0")" ; pwd -P )"
lastestWp="https://fr.wordpress.org/wordpress-$customVersion-fr_FR.tar.gz"

echo "---------------------------------------------------"
echo "------- Installing wordpress $customVersion -------"
echo "---------------------------------------------------"

function _clean {
  read -p "Do you approve a hard clean ? (will delete everything around the script), continue ? (y/n)" -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "Cleaning repository, please wait..."
    find . -not -name 'wp_install.sh' -delete
    echo "Repository Cleaned !"
  fi
}

function getWordpress {
  echo "Looking to the $1 version of Wordpress"
  COMPRESSED_WP=wordpress-$1-fr_FR.tar.gz
  echo "Checking if $COMPRESSED_WP exists in current folder"

  if [ -f $COMPRESSED_WP ]; then
      echo "$COMPRESSED_WP exists"
      echo "Extracting $COMPRESSED_WP, please wait.."
      tar -xf $COMPRESSED_WP
  else
      echo "$COMPRESSED_WP does not exists"
      echo "Downloading the v$finalVersion version of Wordpress"
      wget $lastestWp >/dev/null || curl -O  $lastestWp .
      echo "Extracting $COMPRESSED_WP, please wait.."
      tar -xf $COMPRESSED_WP
  fi

  echo "** Wordpress installed ! **"
  echo "Check it out on $wordpressPath"
}

function is_installed() {
    if [ -f $(pwd)/license.txt ]
    then
        echo "Wordpress already exist do you want to erase (yes/no)"
        read keep
        case $keep in
        yes)
            _clean
            getWordpress $1;;
        no)
            exit 1;;
        *)
            echo "You have to choose something";;
        esac
    else
        getWordpress $1
    fi
}

echo "--- Clearing wordpres folder "
rm -rf wordpress/*

echo "--- Get wordpress "
is_installed $customVersion
# getWordpress $customVersion

echo "---- Script under GNU GPL is written by Ugo Arzur ---"