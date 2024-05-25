 # Neovim Configuration Readme

Welcome to my Neovim configuration! This document provides an overview of the structure and key components of my Neovim setup, designed to enhance productivity and provide a seamless coding experience.

## Directory Structure

The configuration is organized into a modular structure, making it easy to manage and extend. Here's a high-level overview:

```
.
├── init.lua
├── jmawirat
│   ├── config
│   │   ├── basic_settings.lua
│   │   └── init.lua
│   ├── plugins
│   │   ├── init.lua
│   │   ├── mason.lua
│   │   ├── nvim-cmp.lua
│   │   ├── nvim-surround.lua
│   │   ├── nvim-theme.lua
│   │   ├── nvim-tree.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   └── which-key.lua
│   └── remaps
│       ├── init.lua
│       ├── nvim-tree.lua
│       └── telescope.lua
├── lazy-lock.json
└── readme.md
```

## Core Configuration Files

### `init.lua`
This is the main entry point for Neovim. It handles the initialization of plugins, key mappings, and configurations. Key features include:

- **Automatic Installation of lazy.nvim**: Ensures `lazy.nvim` is installed if not already present.
- **Leader Key Setup**: Sets the space key as the leader key for custom shortcuts.
- **Custom Package Paths**: Adds custom paths to `package.path` for easier module loading.
- **Loading Modules**: Loads the plugin configurations, key remaps, and general settings.

### `jmawirat/config`
Contains general configuration settings for Neovim.

- **basic_settings.lua**: Includes basic settings like line numbers, tab width, and other editor preferences.
- **init.lua**: Entry point for loading all configurations in this directory.

### `jmawirat/plugins`
Manages all plugins used in the setup.

- **init.lua**: Initializes the plugin management system and lists all the plugins to be used.
- **mason.lua**: Configuration for the Mason plugin, which manages external tools and language servers.
- **nvim-cmp.lua**: Setup for the `nvim-cmp` completion plugin, enhancing code completion capabilities.
- **nvim-surround.lua**: Adds support for surrounding text objects.
- **nvim-theme.lua**: Configures the theme and appearance of Neovim.
- **nvim-tree.lua**: Configuration for the file explorer plugin.
- **telescope.lua**: Setup for the Telescope fuzzy finder plugin.
- **treesitter.lua**: Configuration for the Treesitter plugin, providing better syntax highlighting and code understanding.
- **which-key.lua**: Configures `which-key` for displaying available keybindings in a popup.

### `jmawirat/remaps`
Handles custom key mappings.

- **init.lua**: Entry point for loading all key mappings in this directory.
- **nvim-tree.lua**: Key mappings specific to the file explorer plugin.
- **telescope.lua**: Key mappings specific to the Telescope plugin.

## Plugin Management

### lazy.nvim
The configuration uses `lazy.nvim` for plugin management, ensuring that all plugins are loaded efficiently. The `lazy-lock.json` file keeps track of the exact plugin versions to ensure reproducibility.

