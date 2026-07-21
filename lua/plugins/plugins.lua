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
    keys = {
      {
        "<leader>k",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "saghen/blink.cmp",
    ---@class PluginLspOpts
    opts = {
      signature = { enabled = true },
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
      },
      completion = { list = { selection = { auto_insert = true } } },
    },
  },
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
      opts.server.settings["rust-analyzer"].files = {
        excludeDirs = {
          ".git",
          "node_modules",
          "target",
          "dist",
          "out",
          ".next",
          "apps",
        },
      }
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "grammarly-languageserver" } },
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "bluloco" } },
  { "coder/claudecode.nvim", opts = { terminal = { split_width_percentage = 0.4 } } },
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
}
