FROM archlinux:latest

# Update system and install Neovim, Node.js, npm, git, and build essentials
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    nodejs \
    npm \
    bun \
    rustup \
    git \
    gcc \
    eza \
    bat \
    ripgrep \
    base-devel \
    neovim \
    zsh \
    zsh-autocomplete \
    zsh-syntax-highlighting \
    starship \
    tmux \
    && pacman -Scc --noconfirm

# Set up a working directory
WORKDIR /workspace

COPY setup-config-files.sh /workspace/setup-config-files.sh

# Run configuration script
RUN chsh -s /bin/zsh
RUN chmod +x /workspace/setup-config-files.sh && /workspace/setup-config-files.sh
RUN rm /workspace/setup-config-files.sh

# Default command to enter the container shell
CMD ["zsh"]
