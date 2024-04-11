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
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldmethod = "manual",
  guicursor = "n-v-c-sm:block,i-ci:ver30-iCursor-blinkwait200-blinkon150-blinkoff150,r-cr-o:hor20",
  conceallevel = 0,
}

vim.g.autoformat = false
vim.g.root_spec = { "cwd" }

for k, v in pairs(options) do
  vim.opt[k] = v
end
