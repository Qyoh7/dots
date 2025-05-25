echo "DEV_ENV: $DEV_ENV"

if [ -z "$DEV_ENV" ]; then
    echo "DEV_ENV is not set"
    exit 1
fi

configs=("waybar" "nvim" "ghostty" "qutebrowser" "rofi" "spicetify")

for cfg in "${configs[@]}"; do
    echo "Copying over $cfg config"
    rm -rf "$HOME/.config/$cfg/"
    cp -r "$DEV_ENV/$cfg" "$HOME/.config/$cfg"
done

if [ "$1" = "--desktop" ]; then
    echo "Copying over hyprland desktop config"
    rm -rf "$HOME/.config/hypr/"
    cp -r "$DEV_ENV/hyprdesk/" "$HOME/.config/hypr/"
    cp "$DEV_ENV/scripts/tmux-sessionizer-desktop" "$HOME/.local/scripts/tmux-sessionizer"
else

    echo "Copying over hyprland laptop config"
    rm -rf "$HOME/.config/hypr/"
    cp -r "$DEV_ENV/hyprtop/" "$HOME/.config/hypr/"
    cp "$DEV_ENV/scripts/tmux-sessionizer" "$HOME/.local/scripts"
fi

if [ ! -d "$HOME/.local/scripts" ]; then
    mkdir -p "$HOME/.local/scripts"
fi

if [ ! -d "$HOME/.local/share/nvim/site/pack/packer" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
else
    echo "packer already installed"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "tpm already installed"
fi

rm -f "$HOME/.zshrc" "$HOME/.tmux.conf"
cp "$DEV_ENV/rcs/.zshrc" "$HOME"
cp "$DEV_ENV/rcs/.tmux.conf" "$HOME"

hyprctl reload
hyprshade toggle blue-light-filter
