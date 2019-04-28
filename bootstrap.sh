#!/bin/bash
# script to symlink files in ~/.dotfiles to the home directory

IGNORE_LINK=(".git" ".gitignore" ".gitmodules")
DOTFILES_DIR="$HOME/.dotfiles/"
BUNDLE_DIR="bundle/"

if [ -z $1 ]; then
    files=$DOTFILES_DIR.*
    echo "All configs prepared for install."
else
    # reading linked list
    if [ -f "$1" ]
    then
        BUNDLE_FULL_PATH=$1
    else
        BUNDLE_FULL_PATH=$DOTFILES_DIR$BUNDLE_DIR$1
    fi

    lines=`cat $BUNDLE_FULL_PATH`

    # execute same name sh script if exist
    if [ -f "$BUNDLE_FULL_PATH.sh" ]
    then
        source $BUNDLE_FULL_PATH.sh
    fi

    bundleLinks=()
    for line in $lines; do
        bundleLinks+=("$DOTFILES_DIR$line");
    done
    files=${bundleLinks[@]}
    echo "Bundle: $1"
fi

successLinkedQty=0

for linkedPath in $files
do
    slash=`echo $linkedPath | tr -cd '/' | wc -c`
    ((slash+=1))
    
    file=`echo $linkedPath | cut -d'/' -f $slash`
    if [[ ${IGNORE_LINK[*]} =~ "$file" ]]
    then
		echo "$file passed (ignored file list)"
    else
        if [ ! -e ~/$file ]
        then
            echo "Creating symlink for $file"
            ln -s $linkedPath ~/$file
            successLinkedQty=$((successLinkedQty+1))
        else
            echo "Config already exists for $file"
        fi
    fi
done

echo "Successfuly linked: $successLinkedQty"

# Update git submodules if exist
git submodule init
git submodule update
