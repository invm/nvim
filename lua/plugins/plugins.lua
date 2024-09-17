return {
  { "echasnovski/mini.pairs", enabled = false },
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
    "windwp/nvim-autopairs",
    opts = { fast_wrap = {}, disable_filetype = { "TelescopePrompt", "vim" } },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      -- setup cmp for autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
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
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
          if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              cmp.confirm()
            end
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i" }),
      })
    end,
  },
}
