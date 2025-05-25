rm -rf $HOME/.config/hypr/
cp -r $DEV_ENV/hyprtop/ $HOME/.config/hypr/

rm -rf $HOME/.config/waybar/
cp -r $DEV_ENV/waybar/ $HOME/.config/waybar/

rm -rf $HOME/.config/nvim/
cp -r $DEV_ENV/nvim $HOME/.config/nvim/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

rm -rf $HOME/.config/ghostty
cp -r $DEV_ENV/ghostty $HOME/.config/ghostty

rm $HOME/.zshrc $HOME/.tmux.conf
cp $DEV_ENV/rcs/.zshrc $HOME
cp $DEV_ENV/rcs/.tmux.conf $HOME

sudo pacman -S zsh
hash -r
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf $HOME/.config/qutebrowser/
cp -r $DEV_ENV/qutebrowser $HOME/.config/qutebrowser/

rm -rf $HOME/.config/rofi/
cp -r $DEV_ENV/rofi $HOME/.config/rofi/

rm -rf $HOME/.config/spicetify/
cp -r $DEV_ENV/spicetify $HOME/.config/spicetify/

pkill hyprpaper
hyprctl reload
hyprshade toggle blue-light-filter

source $DEV_ENV/runs/pkg.sh
