# Use u1and0/zplug as the base image
FROM u1and0/zplug:latest

# Set arguments for cloning dotfiles repository
ARG REPO_URL=https://github.com/simranjeetc/dotfiles.git
ARG TARGET_DIR=/home/u1and0/.config/nvim
ARG ZSH_CUSTOM_DIR=/home/u1and0/oh-my-zsh-custom
ARG PLUGIN_DIR=$ZSH_CUSTOM_DIR/plugins

# Copy setup script into the container
#COPY setup.sh /home/u1and0/setup.sh

# Switch to root user to install necessary packages and run setup
USER root
RUN pacman -Sy --noconfirm git tmux

USER u1and0

WORKDIR /home/u1and0

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN git clone "$REPO_URL" dotfiles && \
    sh dotfiles/setup.sh && \
    rm -rf dotfiles

# Trigger Neovim to install plugins in headless mode
RUN nvim --headless +Lazy! +qall

# Set default shell and switch back to u1and0 user
USER u1and0

SHELL ["/usr/bin/zsh", "-c"]

# Run zplug installation in a non-interactive shell
#RUN zsh -ic "source ~/.zshrc && zplug install"

# Default command
CMD ["/usr/bin/zsh"]

