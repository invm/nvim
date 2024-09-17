-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keys = {
  n = {
    { "<leader>j", "<cmd>:q!<CR>", { desc = "Close window" } },
    { "<leader>pj", "<cmd> :set filetype=json<CR>", { desc = "Set filetype to json" } },
    { "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find files" } },
    { "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" } },
    { "<C-c>", "<ESC>", { desc = "Escape" } },
    { "<C-e>", "<cmd> Telescope find_files <CR>", { desc = "Find files" } },
    { "<C-f>", "<cmd> Telescope live_grep <CR>", { desc = "Live grep" } },
    {
      "]h",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      { desc = "Jump to next hunk" },
    },

    {
      "[h",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      { desc = "Jump to prev hunk" },
    },

    -- Actions
    {
      "<leader>rh",
      function()
        require("gitsigns").reset_hunk()
      end,
      { desc = "Reset hunk" },
    },

    {
      "<leader>ph",
      function()
        require("gitsigns").preview_hunk()
      end,
      { desc = "Preview hunk" },
    },

    {
      "<leader>gb",
      function()
        package.loaded.gitsigns.blame_line()
      end,
      { desc = "Blame line" },
    },
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
    { "<F2>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>" },
    { "<F5>", "<Cmd>lua require'dap'.continue()<CR>" },
    { "<F6>", "<Cmd>lua require'dapui'.eval()<CR>" },
    { "<F9>", "<Cmd>lua require'dapui'.toggle()<CR>" },
    { "<F10>", "<Cmd>lua require'dap'.step_over()<CR>" },
    { "<F11>", "<Cmd>lua require'dap'.step_into()<CR>" },
    { "<F12>", "<Cmd>lua require'dap'.step_out()<CR>" },
  },
  c = {
    { "<C-h>", "<Left>", { desc = "Left" } },
    { "<C-j>", "<Down>", { desc = "Down" } },
    { "<C-l>", "<Right>", { desc = "Right" } },
    { "<C-k>", "<Up>", { desc = "Up" } },
  },
  v = {
    { "p", '"_dP', { silent = true } },
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
