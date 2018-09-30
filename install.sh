echo -e "${GREEN}Setting up git env...${NC}"
git config --global user.email ""
git config --global user.name ""
GREEN='\033[0;32m'
GREEN_L='\033[1;32m'
NC='\033[0m'
echo -e "${GREEN}Installing yay...${NC}"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay/
echo -e "${GREEN}Installing zsh and oh-my-zsh...${NC}"
sudo pacman -S zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed 's:env zsh -l::g')"
echo -e "${GREEN}Installing powerline patched fonts...${NC}"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh 
cd ..
rm -rf fonts
echo -e "${GREEN_L}Powerline patched fonts installed. You can now change your font in Preference."
echo -e "${GREEN}Installing zsh-theme-powerlevel9k...${NC}"
sudo pacman -S zsh-theme-powerlevel9k
echo 'source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc
