# Use an official Node.js runtime as the parent image.
# 'bookworm' is a stable Debian release that is less barebones than 'alpine'.
FROM node:20-bookworm

# Switch to root temporarily to install necessary tools.
USER root

# Install developer tools, same as your Go environment.
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        ripgrep \
        fd-find \
        unzip \
        build-essential \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Symlink `fd` for convenience.
RUN ln -s $(which fdfind) /usr/local/bin/fd || true


# Install Neovim v0.11.3 from the provided URL
RUN curl -L -o nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz && \
    tar xzf nvim-linux-x86_64.tar.gz && \
    mv nvim-linux-x86_64 /opt/nvim && \
    ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim && \
    rm nvim-linux-x86_64.tar.gz

# The node image has a default user named "node" with UID 1000. We will use it.
USER node

# Set the working directory inside the container.
WORKDIR /home/node/app

# Expose the default Vite port.
EXPOSE 5173
