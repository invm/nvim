-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local options = {
  backup = false,
  cmdheight = 1,
  swapfile = false,
  relativenumber = true,
  timeoutlen = 50,
  listchars = "eol:⏎,tab:>·,trail:~,extends:>,precedes:<",
  list = true,
  updatetime = 0,
  guicursor = "n-v-c-sm:block-blinkon1,i-ci:ver30-iCursor-blinkwait200-blinkon150-blinkoff150,r-cr-o:hor20",
  conceallevel = 0,
}

vim.g.autoformat = false
vim.g.root_spec = { "cwd" }
-- turn off lazyvim colorscheme for lazygit
-- vim.g.lazygit_config = false

for k, v in pairs(options) do
  vim.opt[k] = v
end

LazyVim.lazygit.theme.activeBorderColor = { fg = "DiagnosticWarn", bold = true }
