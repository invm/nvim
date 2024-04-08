return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          file_ignore_patterns = { "node%_modules/.*", ".git" },
          prompt_prefix = "   ",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
              preview_width = 0.65,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.92,
            height = 0.90,
            preview_cutoff = 150,
          },
          mappings = {
            i = {
              ["<C-j>"] = "cycle_history_next",
              ["<C-k>"] = "cycle_history_prev",
              ["<C-h>"] = "preview_scrolling_left",
              ["<C-l>"] = "preview_scrolling_right",
            },
          },
        },
      })
    end,
  },
}
