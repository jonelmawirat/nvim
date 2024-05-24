return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                -- Your mason.nvim configuration options here
            }
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "tsserver",
                    "rust_analyzer",
                    "gopls"
                },
                automatic_installation = true,
            }
        end
    },
    {
        "neovim/nvim-lspconfig",
        after = "mason-lspconfig.nvim"
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.preset('recommended')

            lsp.ensure_installed({
                'lua_ls',
                'pyright',
                'tsserver',
                'rust_analyzer',
                'gopls',
            })

            lsp.nvim_workspace()

            lsp.setup()
        end
    }
}

