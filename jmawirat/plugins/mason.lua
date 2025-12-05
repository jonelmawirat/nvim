return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "rust_analyzer",
          "gopls",
          "buf_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local util = require("lspconfig.util")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      local function on_attach(client, bufnr)
        local opts = { buffer = bufnr, silent = true, noremap = true }
        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gi", vim.lsp.buf.implementation, opts)
        map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        map("n", "<space>rn", vim.lsp.buf.rename, opts)
        map("n", "<space>ca", vim.lsp.buf.code_action, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end

      local function make_config(server_config)
        return vim.tbl_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, server_config)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function(args)
          local root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = root_dir,
            single_file_support = true,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
          vim.lsp.start(config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(args)
          local root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "pyright",
            cmd = { "pyright-langserver", "--stdio" },
            root_dir = root_dir,
            filetypes = { "python" },
          })
          vim.lsp.start(config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        callback = function(args)
          local root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "tsserver",
            cmd = { "typescript-language-server", "--stdio" },
            root_dir = root_dir,
            filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
          })
          vim.lsp.start(config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function(args)
          local root_dir = util.root_pattern("go.mod", "go.work", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "gopls",
            cmd = { "gopls" },
            root_dir = root_dir,
          })
          vim.lsp.start(config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rust",
        callback = function(args)
          local root_dir = util.root_pattern("Cargo.toml", "rust-project.json", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "rust_analyzer",
            cmd = { "rust-analyzer" },
            root_dir = root_dir,
          })
          vim.lsp.start(config)
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "proto" },
        callback = function(args)
          local root_dir = util.root_pattern("buf.yaml", "buf.yml", ".git")(vim.api.nvim_buf_get_name(args.buf))
          if not root_dir then
            root_dir = vim.loop.cwd()
          end
          local config = make_config({
            name = "buf_ls",
            cmd = { "buf", "beta", "lsp" },
            root_dir = root_dir,
          })
          vim.lsp.start(config)
        end,
      })
    end,
  },
}

