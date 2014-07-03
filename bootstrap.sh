#!/bin/bash
# script to symlink files in ~/.dotfiles to the home directory

files=~/.dotfiles/.*
ignorefiles=(".gitignore" ".gitmodules")

for full_path in $files
do
    file=`echo $full_path | cut -d'/' -f 5`
    if [[ ${ignorefiles[*]} =~ "$file" ]]
    then
        echo "Pass $file !!!"
    else
        if [ ! -h ~/.$file ]
        then
            echo "Creating symlink for $file"
            ln -s $full_path ~/$file
        else
            echo "Symlink already exists for $file"
        fi
    fi
done
 
echo "Finished creating symlinks."
