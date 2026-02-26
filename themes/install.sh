#!/usr/bin/env bash

ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes"
ZSHRC_FILE="$HOME/.zshrc"
REPO_BASE="https://raw.githubusercontent.com/moinferdi/gruvbox-zsh/main/themes"

echo "------------------------------------------------"
echo "  Gruvbox ZSH Theme Installer"
echo "------------------------------------------------"
echo "Which variant do you want to install?"
echo "  1) Dark  (for dark terminal backgrounds)"
echo "  2) Light (for light terminal backgrounds)"
echo "------------------------------------------------"
read -p "Select option [1/2]: " choice </dev/tty

case $choice in
    1)
        THEME_NAME="gruvbox-dark"
        REMOTE_FILE="gruvbox-dark.zsh-theme"
        ;;
    2)
        THEME_NAME="gruvbox-light"
        REMOTE_FILE="gruvbox-light.zsh-theme"
        ;;
    *)
        echo "Invalid selection. Exiting."
        exit 1
        ;;
esac

REPO_URL="${REPO_BASE}/${REMOTE_FILE}"

# Check Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Error: Oh My Zsh not found at $HOME/.oh-my-zsh."
    exit 1
fi

mkdir -p "$ZSH_CUSTOM_DIR"

echo "Downloading ${THEME_NAME}..."
if ! curl -fsSL "$REPO_URL" -o "${ZSH_CUSTOM_DIR}/${THEME_NAME}.zsh-theme"; then
    echo "Error downloading theme. Please check your internet connection or repo URL."
    exit 1
fi

echo "Configuring .zshrc..."
# Use strict regex to replace existing ZSH_THEME lines
if grep -q "^ZSH_THEME=" "$ZSHRC_FILE"; then
    sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"${THEME_NAME}\"/" "$ZSHRC_FILE"
else
    echo "ZSH_THEME=\"${THEME_NAME}\"" >> "$ZSHRC_FILE"
fi

echo "------------------------------------------------"
echo "  Success! Installed: ${THEME_NAME}"
echo "  Please run 'source ~/.zshrc' to apply changes."
echo "------------------------------------------------"
