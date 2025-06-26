#!/bin/bash

# Ordner, die überwacht werden sollen (volle Pfade)
directories=("$HOME/Bilder" "$HOME/Dokumente" "$HOME/Code")
downloads_directory="$HOME/Downloads"

# Funktion zum Sortieren der Dateien
sort_files() {
    for dir in "${directories[@]}"; do
        for file in "$dir"/*; do
            if [[ -f "$file" ]]; then
                filename="${file##*/}"
                extension="${filename##*.}"
                if [[ "$filename" != "$extension" ]]; then
                    folder="${dir}/${extension}"
                    mkdir -p "$folder"
                    if [[ "$file" != "$folder/$filename" ]]; then
                        mv "$file" "$folder"
                    fi
                else
                    folder="${dir}/no_extension"
                    mkdir -p "$folder"
                    if [[ "$file" != "$folder/$filename" ]]; then
                        mv "$file" "$folder"
                    fi
                fi
            fi
        done
    done
}

# Funktion zum Sortieren der Dateien im Download-Verzeichnis
sort_downloads() {
    for file in "$downloads_directory"/*; do
        if [[ -f "$file" ]]; then
            filename="${file##*/}"
            extension="${filename##*.}"
            if [[ "$filename" != "$extension" ]]; then
                folder="${downloads_directory}/${extension}"
                mkdir -p "$folder"
                if [[ "$file" != "$folder/$filename" ]]; then
                    mv "$file" "$folder"
                fi
            else
                folder="${downloads_directory}/no_extension"
                mkdir -p "$folder"
                if [[ "$file" != "$folder/$filename" ]]; then
                    mv "$file" "$folder"
                fi
            fi
        fi
    done
}

# Endlosschleife, die verschiedene Intervalle verwendet
while true; do
    sort_files
    sleep 30
    ((++count))
    if (( count % 60 == 0 )); then
        sort_downloads
    fi
done
