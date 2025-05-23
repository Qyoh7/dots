rm -rf $HOME/.config/hypr/
cp -r $HOME/personal/dots/hyprtop/ $HOME/.config/hypr/

rm -rf $HOME/.config/waybar/
cp -r $HOME/personal/dots/waybar/ $HOME/.config/waybar/

rm -rf $HOME/.config/nvim/
cp -r $HOME/personal/dots/nvim $HOME/.config/nvim/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

rm -rf $HOME/.config/ghostty
cp -r $HOME/personal/dots/ghostty $HOME/.config/ghostty

rm $HOME/.zshrc $HOME/.tmux.conf
cp $HOME/personal/dots/rcs/.zshrc $HOME
cp $HOME/personal/dots/rcs/.tmux.conf $HOME

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf $HOME/.config/qutebrowser/
cp -r $HOME/personal/dots/qutebrowser $HOME/.config/qutebrowser/

rm -rf $HOME/.config/rofi/
cp -r $HOME/personal/dots/rofi $HOME/.config/rofi/

rm -rf $HOME/.config/spicetify/
cp -r $HOME/personal/dots/spicetify $HOME/.config/spicetify/

pkill hyprpaper
hyprctl reload
hyprshade toggle blue-light-filter
source $HOME/personal/dots/runs/pkg.sh
