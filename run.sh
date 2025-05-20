#sudo pacman -S waybar nvim qutebrowser rofi --noconfirm
rm -rf $HOME/.config/hypr/
cp -r $HOME/personal/dots/hyprtop/ $HOME/.config/hypr/

rm -rf $HOME/.config/waybar/
cp -r $HOME/personal/dots/waybar/ $HOME/.config/waybar/

rm -rf $HOME/.config/nvim/
cp -r $HOME/personal/dots/nvim $HOME/.config/nvim/

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

rm -rf $HOME/.config/qutebrowser/
cp -r $HOME/personal/dots/qutebrowser $HOME/.config/qutebrowser/

rm -rf $HOME/.config/rofi/
cp -r $HOME/personal/dots/rofi $HOME/.config/rofi/

rm -rf $HOME/.config/spicetify/
cp -r $HOME/personal/dots/spicetify $HOME/.config/spicetify/
