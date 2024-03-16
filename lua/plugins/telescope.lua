return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "   ",
          mappings = {
            i = {
              ["<C-l>"] = "cycle_history_next",
              ["<C-h>"] = "cycle_history_prev",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
    end,
  },
}
