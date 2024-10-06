#!/bin/bash

# Copy vimrc contents to ~/.vimrc
if [ -f "vimrc" ]; then
    cp vimrc ~/.vimrc
    echo "vimrc file copied to ~/.vimrc"
else
    echo "Error: vimrc file not found in current directory"
    exit 1
fi

# Create directory for vim themes
mkdir -p ~/.vim/pack/themes/start

# Change to the themes directory
cd ~/.vim/pack/themes/start || exit

# Clone the vim-code-dark theme repository
if git clone https://github.com/tomasiser/vim-code-dark; then
    echo "vim-code-dark theme installed successfully"
else
    echo "Error: Failed to clone vim-code-dark theme"
    exit 1
fi

# Change back to the original directory
cd - || exit

# Clone the 42header repository
if git clone https://github.com/42Paris/42header.git; then
    echo "42header repository cloned successfully"
else
    echo "Error: Failed to clone 42header repository"
    exit 1
fi

# Create plugin directory if it doesn't exist
mkdir -p ~/.vim/plugin

# Copy the stdheader.vim file to the plugin directory
if cp 42header/plugin/stdheader.vim ~/.vim/plugin/; then
    echo "stdheader.vim copied to ~/.vim/plugin/"
else
    echo "Error: Failed to copy stdheader.vim"
    exit 1
fi

# Clean up: remove the cloned 42header repository
rm -rf 42header

echo "Setup completed successfully!"
