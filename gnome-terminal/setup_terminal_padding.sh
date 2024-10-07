#!/bin/bash

# Define the CSS content
CSS_CONTENT="VteTerminal,
 TerminalScreen,
 vte-terminal {
     padding: 15px 15px 15px 15px;
     -VteTerminal-inner-border: 15px 15px 15px 15px;
 }"

# Define the target file
TARGET_FILE="$HOME/.config/gtk-3.0/gtk.css"

# Create the directory if it doesn't exist
mkdir -p "$(dirname "$TARGET_FILE")"

# Check if the file exists and if the content is already there
if [ -f "$TARGET_FILE" ]; then
    if grep -qF "VteTerminal," "$TARGET_FILE"; then
        echo "The CSS content already exists in $TARGET_FILE. No changes made."
        exit 0
    fi
fi

# Append the CSS content to the file
echo "$CSS_CONTENT" >> "$TARGET_FILE"
echo "CSS content has been added to $TARGET_FILE"

echo "Script completed successfully!"

