return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go", "python", "yang", "html", "json" },
                sync_install = false,
                highlight = {
                    enable = true,              -- false will disable the whole extension
                    additional_vim_regex_highlighting = false,
                },
            }

            -- Define custom highlight groups
            vim.api.nvim_set_hl(0, "TSMethod", { fg = "#FF8800" }) -- Custom color for methods
            vim.api.nvim_set_hl(0, "TSFunction", { fg = "#00FF00" }) -- Custom color for functions
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require'treesitter-context'.setup{
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    }
}

