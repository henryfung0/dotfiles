#install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

#GCC
sudo apt-get update
sudo apt-get install build-essential
#Clang
sudo apt-get update
sudo apt-get install clang
