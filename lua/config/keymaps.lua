-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keys = {
  n = {
    { "<leader>js", "<cmd> :set filetype=json<CR>", { desc = "Set filetype to json" } },
    {
      "<leader>cx",
      function()
        local file = vim.fn.expand("%:p")
        print("Current file: " .. file)
        vim.cmd("vsplit | terminal ")
        local command = ':call jobsend(b:terminal_job_id, "lua ' .. file .. '\\n")'
        vim.cmd(command)
      end,
      { desc = "execute lua on current buffer" },
    },
  },
  c = {
    { "<C-h>", "<Left>", { desc = "Left" } },
    { "<C-j>", "<Down>", { desc = "Down" } },
    { "<C-l>", "<Right>", { desc = "Right" } },
    { "<C-k>", "<Up>", { desc = "Up" } },
  },
}

for mode, maps in pairs(keys) do
  for _, map in pairs(maps) do
    local key = map[1]
    local value = map[2]
    local opts = map[3] or {}
    vim.keymap.set(mode, key, value, opts)
  end
end
