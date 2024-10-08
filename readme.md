# Neovim Configuration - `nvim`

This is my personal Neovim configuration. It's designed to provide a fast, customizable, and efficient setup for coding, writing, and general text editing.

## Table of Contents
1. [Requirements](#requirements)
2. [Installation](#installation)
3. [Directory Structure](#directory-structure)
4. [Features](#features)
5. [Usage](#usage)
6. [Updating Plugins](#updating-plugins)
7. [Contributing](#contributing)

## Requirements

Before using this configuration, ensure you have the following installed:

- **Neovim** (v0.8+)
- **Git**
- **Node.js** (for some language servers or plugins)
- **Python3** (for Python support and some language servers)
- **Ripgrep** (for improved search functionality)

### Optional

- **fzf** for fuzzy searching.
- **Packer** (Neovim plugin manager) - this config uses lazy-loading for plugins. You don’t need to install Packer manually, as it’s included in the setup.

## Installation

To use this Neovim configuration:

1. **Backup your existing configuration (if any):**
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone the repository:**
   ```bash
   git clone git@github.com:jonelmawirat/nvim.git ~/.config/nvim
   ```

3. **Open Neovim:**
   ```bash
   nvim
   ```

4. **Install plugins**:
   Inside Neovim, run the following command to install the plugins specified in `init.lua`:
   ```bash
   :Lazy sync
   ```

   This will use the Lazy.nvim plugin manager to synchronize and install all the required plugins.

5. **Start using your configuration!**

## Directory Structure

The Neovim config directory (`~/.config/nvim`) is structured as follows:

```
nvim/
│
├── .git/               # Git repository data (if applicable)
├── init.lua            # Main configuration file (entry point for settings and plugins)
├── lazy-lock.json      # Lockfile for installed plugins (managed by Lazy.nvim)
├── jmawirat/           # Custom Lua modules for settings, keymaps, and plugin configs
├── readme.md           # This README file
└── undodir/            # Directory for storing persistent undo history
```

- **`init.lua`**: This is the main configuration file, where all the core settings and plugin definitions are placed.
- **`lazy-lock.json`**: Automatically generated by Lazy.nvim to lock plugin versions.
- **`jmawirat/`**: This directory contains additional Lua scripts for key mappings, plugin settings, and configurations.
- **`undodir/`**: Stores persistent undo files for Neovim’s undo history.

## Features

- **Lazy-loaded Plugins**: This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) to handle plugins, optimizing loading times.
- **LSP Support**: Built-in support for various language servers using Neovim’s LSP.
- **Treesitter Integration**: Syntax highlighting and code parsing powered by Treesitter.
- **Telescope**: Fuzzy finder for files, buffers, and more.
- **Custom Keybindings**: Optimized keymaps for quicker navigation and coding.

## Usage

After installing the config, here are some common commands you may use:

- **Install new plugins**:
  To add a plugin, modify the `init.lua` file and include your plugin. Then, run `:Lazy sync` inside Neovim.
  
- **Check health**:
  To ensure everything is working properly, run:
  ```bash
  :checkhealth
  ```

- **Update Plugins**:
  To update all plugins to the latest version, run:
  ```bash
  :Lazy update
  ```

- **Fuzzy Find (Telescope)**:
  Use the following keybinding to trigger Telescope’s fuzzy finding:
  ```bash
  <leader>ff
  ```

## Updating Plugins

To update plugins, run the following command inside Neovim:
```bash
:Lazy update
```

This will pull the latest versions of your installed plugins and update the `lazy-lock.json` file accordingly.
