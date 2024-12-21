return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        theme = {
          activeBorderColor = { fg = "DiagnosticWarn", bold = true },
          [241] = { fg = "Special" },
          cherryPickedCommitBgColor = { fg = "Identifier" },
          cherryPickedCommitFgColor = { fg = "Function" },
          defaultFgColor = { fg = "Normal" },
          inactiveBorderColor = { fg = "FloatBorder" },
          optionsTextColor = { fg = "Function" },
          searchingActiveBorderColor = { fg = "MatchParen", bold = true },
          selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
          unstagedChangesColor = { fg = "DiagnosticError" },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@class PluginLspOpts
    opts = { signature = { enabled = true }, keymap = { preset = "super-tab" } },
  },
  -- { "echasnovski/mini.pairs", enabled = false },
  { "folke/which-key.nvim", opts = { preset = "modern" } },
  { "folke/noice.nvim", opts = { notify = { enabled = false } } },
  { "rcarriga/nvim-notify", enabled = false },
  { "linux-cultist/venv-selector.nvim", enabled = false },
  { "mg979/vim-visual-multi" },
  { "theHamsta/nvim-dap-virtual-text", enabled = false },
  { "nvim-lspconfig", opts = { inlay_hints = { enabled = false } } },
  {
    "mrcjkb/rustaceanvim",
    opts = function(_, opts)
      opts.server = opts.server or {}
      opts.server.settings = opts.server.settings or {}
      opts.server.settings["rust-analyzer"] = opts.server.settings["rust-analyzer"] or {}
      opts.server.settings["rust-analyzer"].procMacro = { enable = true }
      -- opts.server.settings["rust-analyzer"].diagnostics = {
      --   enable = true,
      --   disabled = { "unresolved-proc-macro", "unresolved-macro-call" },
      --   enableExperimental = true,
      -- }
    end,
  },
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>k",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "typescript-language-server",
        "pyright",
        "bash-language-server",
        "json-lsp",
        "gopls",
        "codelldb",
        "yaml-language-server",
        "grammarly-languageserver",
        "prettier",
        "stylua",
        "black",
        "shellcheck",
        "eslint_d",
        "typos",
        "flake8",
        "shfmt",
        "ruff",
      },
    },
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      -- your optional config goes here, see below.
    end,
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "bluloco" } },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "go",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
