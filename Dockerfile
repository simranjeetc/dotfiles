# Use u1and0/zplug as the base image
FROM u1and0/zplug:latest

# Set arguments for cloning dotfiles repository
ARG REPO_URL=https://github.com/simranjeetc/dotfiles.git
ARG TARGET_DIR=/home/u1and0/.config/nvim
ARG ZSH_CUSTOM_DIR=/home/u1and0/oh-my-zsh-custom
ARG PLUGIN_DIR=$ZSH_CUSTOM_DIR/plugins

# Copy setup script into the container
COPY setup.sh /setup.sh

# Switch to root user to install necessary packages
USER root
RUN pacman -Sy --noconfirm git

# Clone the dotfiles repo and run the setup script
USER u1and0
RUN git clone "$REPO_URL" dotfiles && \
    chmod +x /setup.sh && \
    /setup.sh && \
    rm -rf dotfiles /setup.sh

# Set default shell to zsh for the user
SHELL ["/usr/bin/zsh", "-c"]

# Default command
CMD ["/usr/bin/zsh"]

