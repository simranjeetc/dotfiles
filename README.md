
# Dotfiles Setup

This repository contains configuration files for Neovim, Zsh, and other tools. You can easily set up your environment by downloading and running the setup script appropriate for your operating system. 

## Quick Start

Choose the setup script based on your operating system and follow the steps below to download and run it.

### Docker Image

**Docker image available at **
   ```bash
      docker run -it simranchawla/zsh:latest
   ```

### Linux/macOS

1. **Download the `setup.sh` script:**
   ```bash
   curl -O https://raw.githubusercontent.com/simranjeetc/dotfiles/main/setup.sh
   ```

2. **Make the script executable:**
   ```bash
   chmod +x setup.sh
   ```

3. **Run the script:**
   ```bash
   ./setup.sh
   ```

4. **Post installation**
   ```bash
   source ~/.zshrc
   ```

### Windows

1. **Download the `setup.bat` script:**
   ```powershell
   Invoke-WebRequest -Uri https://raw.githubusercontent.com/simranjeetc/dotfiles/main/setup.bat -OutFile setup.bat
   ```

2. **Run the script** by double-clicking `setup.bat` in File Explorer or executing it in the Command Prompt:
   ```cmd
   setup.bat
   ```

## What the Setup Scripts Do

The setup script will:
- Clone this repository.
- Copy Neovim configuration files to the appropriate location (`~/.config/nvim` on Linux/macOS or `%USERPROFILE%\.config\nvim` on Windows).
- Copy the `.zshrc` file to the home directory.
- Copy `oh-my-zsh-custom` configurations to the home directory (`~/oh-my-zsh-custom`).
- Clone `zsh-syntax-highlighting` and `zsh-autosuggestions` plugins to the `~/oh-my-zsh-custom/plugins/` directory.

**Note:** Each run will overwrite existing configurations with a warning.

## Prerequisites

- Ensure that Git is installed on your system.
- The setup scripts are designed to overwrite any existing configurations. Make backups if necessary.


