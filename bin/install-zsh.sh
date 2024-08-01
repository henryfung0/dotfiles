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
ZOXIDE_FILE="~/.local/bin/zoxide"
if [ -f "$ZOXIDE_FILE" ]; then
    # Move the zoxide file to /usr/local/bin/
    sudo mv "$ZOXIDE_FILE" /usr/local/bin/
fi

chsh -s $(which zsh)

CURRENT_DIR=$(pwd)
cd ..
stow --adopt zsh
cd "$CURRENT_DIR"

# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

CURRENT_DIR=$(pwd)
cd ..
stow --adopt atuin
cd "$CURRENT_DIR"
