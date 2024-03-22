#!/usr/bin/env bash

source_folder=./hooks
destination_folder=~/.git-hooks


if [ -d "$destination_folder" ]; then
    echo "Folder exists."
    echo "Copying files over..."
else
    echo "Folder does not exist."
    echo "Creating destination_folder..."
    mkdir ~/.git-hooks
    echo "Copying files over..."
fi

# Loop through each file in the source folder
for file in "$source_folder"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if [ -f "$destination_folder/$filename" ]; then
            echo "File $filename already exists in the destination folder. It won't be copied."
        else
            cp "$file" "$destination_folder/"
            echo "File $filename copied successfully."
        fi
    fi
done


echo "Installation complete!"