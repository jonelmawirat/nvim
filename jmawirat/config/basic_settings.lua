
-- Example basic settings
vim.o.number = true                -- Enable line numbers
vim.o.relativenumber = true        -- Enable relative line numbers
vim.o.hlsearch = true              -- Highlight search results
vim.o.ignorecase = true            -- Ignore case in search patterns
vim.o.smartcase = true             -- Override ignorecase if search pattern contains uppercase letters
vim.o.tabstop = 4                  -- Number of spaces a tab counts for
vim.o.shiftwidth = 4               -- Number of spaces to use for each step of (auto)indent
vim.o.expandtab = true             -- Use spaces instead of tabs
vim.o.smartindent = true           -- Smart indentation
vim.o.autoindent = true            -- Copy indent from current line when starting a new line
vim.o.cursorline = false            -- Highlight the current line
vim.o.wrap = false                 -- Disable line wrapping
vim.o.swapfile = false             -- Disable swapfile
vim.o.backup = false               -- Disable backup
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undodir" -- Set undo directory
vim.o.undofile = true              -- Enable persistent undo

-- Key mappings for clipboard
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+Y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>Y', '"+Y', { noremap = true, silent = true })



-- Go to definition (usually already mapped to `gd` by lsp-zero)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Go back
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>', { noremap = true, silent = true })

-- Insert this autocommand to center the cursor line on InsertEnter
-- vim.cmd [[autocmd InsertEnter * norm zz]]

-- Disable Ctrl+Z suspend in Neovim
vim.keymap.set('', '<C-z>', '<Nop>')

-- Reduce the time it takes for the CursorHold event to trigger
vim.o.updatetime = 300

-- Show diagnostics automatically in a floating window
vim.cmd [[
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]

