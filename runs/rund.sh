echo "DEV_ENV: $DEV_ENV"

if [ -z "$DEV_ENV" ]; then
    echo "DEV_ENV is not set"
    exit 1
fi

configs=("waybar" "nvim" "ghostty" "qutebrowser" "rofi" "spicetify")

for cfg in "${configs[@]}"; do
    rm -rf "$HOME/.config/$cfg/"
    cp -r "$DEV_ENV/$cfg" "$HOME/.config/$cfg"
done

if [ "$1" = "--desktop" ]; then
    rm -rf "$HOME/.config/hypr/"
    cp -r "$DEV_ENV/hyprdesk/" "$HOME/.config/hypr/"
    cp "$DEV_ENV/scripts/tmux-sessionizer-desktop" "$HOME/.local/scripts/tmux-sessionizer"
else
    rm -rf "$HOME/.config/hypr/"
    cp -r "$DEV_ENV/hyprtop/" "$HOME/.config/hypr/"
    cp "$DEV_ENV/scripts/tmux-sessionizer" "$HOME/.local/scripts"
fi

if [ ! -d "$HOME/.local/scripts" ]; then
    mkdir -p "$HOME/.local/scripts"
fi

git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

rm -f "$HOME/.zshrc" "$HOME/.tmux.conf"
cp "$DEV_ENV/rcs/.zshrc" "$HOME"
cp "$DEV_ENV/rcs/.tmux.conf" "$HOME"

hyprctl reload
hyprshade toggle blue-light-filter
