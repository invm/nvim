-- The explorer is a float, so `winnr("h"|"j"|"k"|"l")` all return the same
-- window and tmux-navigator can never tell it hit an edge. Do it by hand.
-- ponytail: <c-l> assumes the editor is right of the explorer, which is the
-- only layout here; make it geometry-aware if that ever stops being true.
local function nav(dir)
  return function()
    if dir == "l" then
      return vim.cmd.wincmd("p") -- back to the editor window
    end
    if vim.env.TMUX then
      local pane = ({ h = "-L", j = "-D", k = "-U" })[dir]
      vim.system({ "tmux", "select-pane", "-t", vim.env.TMUX_PANE, pane })
    else
      vim.cmd.wincmd(dir)
    end
  end
end

local nav_keys = {}
for _, dir in ipairs({ "h", "j", "k", "l" }) do
  nav_keys["<c-" .. dir .. ">"] = { nav(dir), mode = { "i", "n" }, desc = "Navigate " .. dir }
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        win = {
          input = {
            keys = {
              ["<c-k>"] = { "history_back", mode = { "i", "n" } },
              ["<c-j>"] = { "history_forward", mode = { "i", "n" } },
            },
          },
        },
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            exclude = { ".git", ".DS_Store", "node_modules" },
            -- the explorer is a float, so tmux-navigator's `wincmd h` always
            -- "succeeds" and it never forwards the key to tmux. Go direct.
            win = { list = { keys = nav_keys }, input = { keys = nav_keys } },
          },
        },
      },
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
  { "linux-cultist/venv-selector.nvim", enabled = false },
  { "mg979/vim-visual-multi" },
  { "theHamsta/nvim-dap-virtual-text", enabled = false },
  { "nvim-lspconfig", opts = { inlay_hints = { enabled = false }, servers = { harper_ls = {} } } },
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
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
  },
  { "LazyVim/LazyVim", opts = { colorscheme = "bluloco" } },
  { "coder/claudecode.nvim", opts = { terminal = { split_width_percentage = 0.4 } } },
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
}
