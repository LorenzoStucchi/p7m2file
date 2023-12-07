#!/bin/bash

original_dir=$(pwd)

read -p "Folder path: " folder_path

if [ -d "$folder_path" ]; then
    cd "$folder_path" || exit
    p7m_files=()
    mkdir p7m
    
    for file in *.p7m; do
        p7m_files+=("$folder_path/$file")
    done

    cd "$original_dir" || exit
    for file in "${p7m_files[@]}"; do
        yes | sh p7m.sh -x $file
        mv "$file" "$folder_path/p7m"
    done

else
    echo "Folder not found: $folder_path"
fi

