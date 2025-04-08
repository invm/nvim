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
  scrolloff = 8,
  sidescrolloff = 8,
  wrap = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local g_options = {
  autoformat = false,
  root_spec = { "cwd" },
  loaded_perl_provider = 0,
  loaded_ruby_provider = 0,
  snacks_animate = false,
}

for k, v in pairs(g_options) do
  vim.g[k] = v
end

local append_options = {
  shortmess = "c",
  whichwrap = "<,>,[,],h,l",
  iskeyword = "-",
}

for k, v in pairs(append_options) do
  vim.opt[k]:append(v)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
