rm -rf $HOME/.config/hypr/
cp -r $DEV_ENV/hyprdesk/ $HOME/.config/hypr/

rm -rf $HOME/.config/waybar/
cp -r $DEV_ENV/waybar/ $HOME/.config/waybar/

rm -rf $HOME/.config/nvim/
cp -r $DEV_ENV/nvim $HOME/.config/nvim/
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir ~/.local/scripts
cp -r $DEV_ENV/runs/tmux-sessionizer ~/.local/scripts

rm -rf $HOME/.config/ghostty
cp -r $DEV_ENV/ghostty $HOME/.config/ghostty

rm $HOME/.zshrc $HOME/.tmux.conf
cp $DEV_ENV/rcs/.zshrc $HOME
cp $DEV_ENV/rcs/.tmux.conf $HOME

mkdir ~/.local/scripts
cp $DEV_ENV/runs/tmux-sessionizer-desktop ~/.local/scripts/tmux-sessionizer

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

rm -rf $HOME/.config/qutebrowser/
cp -r $DEV_ENV/qutebrowser $HOME/.config/qutebrowser/

rm -rf $HOME/.config/rofi/
cp -r $DEV_ENV/rofi $HOME/.config/rofi/

rm -rf $HOME/.config/spicetify/
cp -r $DEV_ENV/spicetify $HOME/.config/spicetify/
hyprctl reload
hyprshade toggle blue-light-filter
