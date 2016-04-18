#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

# development tools
brew install git
brew install zsh
brew install tmux
brew install macvim --override-system-vim
brew install reattach-to-user-namespace

# install neovim
brew install neovim/neovim/neovim
