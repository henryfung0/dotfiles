#!/bin/sh
sudo apt update -y 
sudo apt upgrade -y
sudo apt install zsh git curl -y

# ohmy zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# PowerLevel10k
sudo git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# zsh-autosuggestions
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Zsh-z
sudo git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
# command not found: zoxide (error)
sudo mv ~/.local/bin/zoxide /usr/local/bin/

chsh -s $(which zsh)

stow --adopt ../zsh

# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

stow --adopt ../atuin
