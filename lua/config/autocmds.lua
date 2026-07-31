-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Pickers open async, so keys typed before the window is up land in the buffer
-- behind it (typing "dis" runs d, i, s on a real file).
-- https://github.com/folke/snacks.nvim/issues/2578
-- deferred: this file is loaded before snacks, so `Snacks` isn't up yet
vim.schedule(function()
  local pick = Snacks.picker.pick
  Snacks.picker.pick = function(...)
    local p = pick(...)
    -- also wait on `closed`: no-result pickers never get shown
    if p then
      vim.wait(2000, function()
        return p.shown or p.closed
      end, 10)
    end
    return p
  end
end)
