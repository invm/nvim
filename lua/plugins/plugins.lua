return {
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
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
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "bluloco",
    },
  },
  { import = "lazyvim.plugins.extras.lang.typescript" },
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
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "ThePrimeagen/vim-be-good",
  },
}
