
@echo off
set REPO_URL=https://github.com/simranjeetc/dotfiles.git
set TARGET_DIR=%USERPROFILE%\.config\nvim
set ZSH_CUSTOM_DIR=%USERPROFILE%\oh-my-zsh-custom
set PLUGIN_DIR=%ZSH_CUSTOM_DIR%\plugins

echo Starting setup...

:: Clone or update the repository
if exist "dotfiles" (
    echo Updating existing dotfiles repository...
    cd dotfiles
    git pull
    cd ..
) else (
    echo Cloning dotfiles repository...
    git clone %REPO_URL%
)

:: Copy nvim configuration files
echo Copying nvim configuration to %TARGET_DIR%...
mkdir "%TARGET_DIR%" 2>nul
xcopy /E /I /Y dotfiles\nvim\* "%TARGET_DIR%"
echo nvim configuration copied successfully.

:: Copy .zshrc
echo Copying zsh configurations to %USERPROFILE% directory...
copy /Y dotfiles\zsh\zshrc "%USERPROFILE%\.zshrc"
echo Copied zsh configurations successfully.

:: Copy oh-my-zsh custom configurations
echo Copying oh-my-zsh custom configurations to %ZSH_CUSTOM_DIR%...
mkdir "%ZSH_CUSTOM_DIR%" 2>nul
xcopy /E /I /Y dotfiles\zsh\oh-my-zsh-custom\* "%ZSH_CUSTOM_DIR%"
echo oh-my-zsh custom configurations copied successfully.

:: Clone zsh plugins
echo Setting up zsh plugins...
mkdir "%PLUGIN_DIR%" 2>nul
if exist "%PLUGIN_DIR%\zsh-syntax-highlighting" (
    echo Updating zsh-syntax-highlighting...
    git -C "%PLUGIN_DIR%\zsh-syntax-highlighting" pull
) else (
    echo Cloning zsh-syntax-highlighting...
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "%PLUGIN_DIR%\zsh-syntax-highlighting"
)

if exist "%PLUGIN_DIR%\zsh-autosuggestions" (
    echo Updating zsh-autosuggestions...
    git -C "%PLUGIN_DIR%\zsh-autosuggestions" pull
) else (
    echo Cloning zsh-autosuggestions...
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "%PLUGIN_DIR%\zsh-autosuggestions"
)

echo Setup completed successfully.
