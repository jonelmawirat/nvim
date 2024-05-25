return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "go", "python", "yang", "html", "json" },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                    persist_queries = false, -- Whether the query persists across vim sessions
                },
            }

            -- Define custom highlight groups if needed
            vim.api.nvim_set_hl(0, "TSMethod", { fg = "#FF8800" })
            vim.api.nvim_set_hl(0, "TSFunction", { fg = "#00FF00" })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require'treesitter-context'.setup{
                enable = true,
                throttle = true,
                max_lines = 0,
                patterns = {
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    {
        "nvim-treesitter/playground",
        requires = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require'nvim-treesitter.configs'.setup {
                playground = {
                    enable = true,
                    disable = {},
                    updatetime = 25,
                    persist_queries = false,
                }
            }
        end
    }
}

