
#!/bin/bash

REPO_URL="https://github.com/simranjeetc/dotfiles.git"
TARGET_DIR="$HOME/.config/nvim"
ZSH_CUSTOM_DIR="$HOME/oh-my-zsh-custom"
PLUGIN_DIR="$ZSH_CUSTOM_DIR/plugins"

echo "Starting setup..."

# Clone or update the repository
if [ -d "dotfiles" ]; then
    echo "Updating existing dotfiles repository..."
    cd dotfiles && git pull && cd ..
else
    echo "Cloning dotfiles repository..."
    git clone "$REPO_URL"
fi

# Copy nvim configuration files
echo "Copying nvim configuration to $TARGET_DIR..."
mkdir -p "$TARGET_DIR"
cp -r dotfiles/nvim/* "$TARGET_DIR"
echo "nvim configuration copied successfully."

# Copy lunarVim configuraion files
# echo "Copying lunarVim configuration to $HOME/.config/lvim"
# mkdir -p "$HOME/.config/lvim"
# cp -r dotfiles/lunarVim/* "$HOME/.config/lvim"
# echo "lunarVim configuration copied successfully" 

# Copy .zshrc
echo "Copying .zshrc to $HOME directory..."
cp dotfiles/zsh/.zshrc "$HOME/.zshrc"
echo ".zshrc copied successfully."

# Copy oh-my-zsh custom configurations
echo "Copying oh-my-zsh custom configurations to $ZSH_CUSTOM_DIR..."
mkdir -p "$ZSH_CUSTOM_DIR"
cp -r dotfiles/zsh/oh-my-zsh-custom/* "$ZSH_CUSTOM_DIR"
echo "oh-my-zsh custom configurations copied successfully."

# Clone zsh plugins
echo "Setting up zsh plugins..."
mkdir -p "$PLUGIN_DIR"
if [ -d "$PLUGIN_DIR/zsh-syntax-highlighting" ]; then
    echo "Updating zsh-syntax-highlighting..."
    git -C "$PLUGIN_DIR/zsh-syntax-highlighting" pull
else
    echo "Cloning zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGIN_DIR/zsh-syntax-highlighting"
fi

if [ -d "$PLUGIN_DIR/zsh-autosuggestions" ]; then
    echo "Updating zsh-autosuggestions..."
    git -C "$PLUGIN_DIR/zsh-autosuggestions" pull
else
    echo "Cloning zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$PLUGIN_DIR/zsh-autosuggestions"
fi

echo "Setup completed successfully."
