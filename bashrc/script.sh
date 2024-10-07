#!/bin/bash

# Define the corrected PS1 prompt without the initial space
PROMPT='PS1="\[\e[1;32m\]\[\e[1;34m\]\u\[\e[0m\]:\[\e[1;33m\]\W\[\e[0m\]\$ "'

# Function to add the prompt to a file if it doesn't already exist
add_prompt_if_not_exists() {
    local file="$1"
    # Use double quotes around the variable and escape quotes in grep
    if ! grep -q "$(echo "$PROMPT" | sed 's/[]\/$.*+?()[{!^|]/\\&/g')" "$file"; then
        echo "$PROMPT" >> "$file"
        echo "Added PS1 to $file"
    else
        echo "PS1 already exists in $file"
    fi
}

# Add to .bashrc
add_prompt_if_not_exists "$HOME/.bashrc"

# Add to .zshrc
add_prompt_if_not_exists "$HOME/.zshrc"

# Reload the shell configuration
echo "Reloading shell configurations..."
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi
if [ -f "$HOME/.zshrc" ]; then
    source "$HOME/.zshrc"
fi

