#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <file.asm>"
    exit 1
fi


function removing_files {
    rm -f "$name.o" "$name"
}
function removing_objects {
    rm -f "$name.o"
}

name=$(basename "$1" ".asm")
echo "File name without extension: $name"
echo "removing old files..."
removing_files
echo "COMPILING TO .o"
nasm -f elf64 "$1" -o "$name.o"

echo "COMPILING TO EXECUTABLE"
ld "$name.o" -o "$name"

echo "Done! Executable is $name"
echo "Running..."
removing_objects
./"$name"