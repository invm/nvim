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

-- bluloco gives NormalFloat & co blend=5, so floats draw the text behind them
-- in a near-background colour. Rex's minimum contrast makes that text readable.
if vim.env.TERM_PROGRAM == "rex" then
  local function unblend()
    for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
      if hl.blend and not hl.link then
        hl.blend = nil
        vim.api.nvim_set_hl(0, name, hl)
      end
    end
  end
  unblend()
  vim.api.nvim_create_autocmd("ColorScheme", { callback = unblend })
end
