#!/usr/bin/env bash

echo "Installing Dotfiles"

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning OSX specific scripts"
    source install/brew.sh
fi

echo "Cloning Repositories"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Initializing Submodules"
git submodule update --init --recursive


echo "Configuring zsh as default shell"
chsh -s $(which zsh)

source install/link.sh

nvim +PluginInstall +qall

echo "Done."
