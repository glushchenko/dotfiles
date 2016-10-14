#!/bin/bash
# script to symlink files in ~/.dotfiles to the home directory

IGNORE_LINK=(".gitignore" ".gitmodules")
DOTFILES_DIR="$HOME/.dotfiles/"

if [ -z $1 ]; then
    files=$DOTFILES_DIR.*
    echo "All configs prepared for install."
else
    bundleLinks=()
    lines=`cat $DOTFILES_DIR/bundle.$1`
    for line in $lines; do
        bundleLinks+=("$DOTFILES_DIR$line");
    done
    files=${bundleLinks[@]}
    echo "Bundle: $1"
fi

successLinkedQty=0

for linkedPath in $files
do
    file=`echo $linkedPath | cut -d'/' -f 5`
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
