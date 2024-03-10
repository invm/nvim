return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        filesystem = { window = { mappings = { ["o"] = "open" } } },
        buffers = { window = { mappings = { ["o"] = "open" } } },
        git_status = { window = { mappings = { ["o"] = "open" } } },
      })
    end,
  },
}
