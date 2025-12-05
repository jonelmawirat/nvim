return {
    -- Mason configuration
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                -- Your Mason configuration options here
            }
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = "mason.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",            -- Updated from "tsserver" to "ts_ls"
                    "rust_analyzer",
                    "gopls",
                    "buf_ls",
                },
                automatic_installation = true,
            }
        end,
    },
    {
        "neovim/nvim-lspconfig",
        after = "mason-lspconfig.nvim",
        config = function()
            local lspconfig = require('lspconfig')

            -- Common on_attach function
            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

                buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

                -- Key mappings
                local opts = { noremap = true, silent = true }
                buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
                buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
                buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
                buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
            end

            -- Updated list of LSP servers
            local servers = {
                'lua_ls',
                'pyright',
                'ts_ls',          -- Updated from "tsserver" to "ts_ls"
                'rust_analyzer',
                'gopls',
                'buf_ls',
            }

            -- Setup each LSP server
            for _, server in ipairs(servers) do
                lspconfig[server].setup {
                    on_attach = on_attach,
                }
            end
        end,
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.preset('recommended')

            lsp.ensure_installed({
                'lua_ls',
                'pyright',
                'ts_ls',         -- Updated from "tsserver" to "ts_ls"
                'rust_analyzer',
                'gopls',
            })

            lsp.nvim_workspace()

            lsp.setup()
        end,
    }
}

