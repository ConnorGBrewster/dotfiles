#!/usr/bin/env bash

echo "Installing Dotfiles"

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning OSX specific scripts"
    
    source install/brew.sh
fi
echo "Initializing Submodules"
git submodule update --init --recursive


echo "Configuring zsh as default shell"
chsh -s $(which zsh)

source install/link.sh



echo "Done."
