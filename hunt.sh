#!/bin/bash

BASE="$HOME/hunt"

# Clean old run
rm -rf "$BASE"

# Create small maze
mkdir -p "$BASE/room1"
mkdir -p "$BASE/room2/secret"
mkdir -p "$BASE/storage"

# Decoys
touch "$BASE/room1/nothing.txt"
touch "$BASE/storage/useless.log"

# Real clue
cat <<EOF > "$BASE/room2/secret/clue.txt"
🎉 Well played.

But there is a better way to do this ;)

Go back to your home directory.
Think recursively.
EOF

echo ""
echo "Hunt created at: $BASE"
echo ""
echo "Rules:"
echo "1. Use only: cd and ls"
echo "2. Find clue.txt"
echo ""
echo "Go!"
