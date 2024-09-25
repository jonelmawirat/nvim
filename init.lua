local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Set space as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add custom paths to package.path
local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/nvim/?.lua;" .. home .. "/.config/nvim/?/init.lua"

-- Load lazy.nvim
require('lazy').setup(require('jmawirat.plugins'))

-- Load remaps
require('jmawirat.remaps')

-- Load configurations
require('jmawirat.config')

