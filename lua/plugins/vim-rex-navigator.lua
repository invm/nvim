return {
  {
    "pankrashin/vim-rex-navigator",
    main = "vim-rex-navigator",
    cond = vim.env.TERM_PROGRAM == "rex",
    opts = { focus = false, move = false, resize = false, close = false },
    keys = {
      { "<C-h>", "<cmd>RexFocusLeft<cr>", mode = { "n", "t" } },
      { "<C-j>", "<cmd>RexFocusDown<cr>", mode = { "n", "t" } },
      { "<C-k>", "<cmd>RexFocusUp<cr>", mode = { "n", "t" } },
      { "<C-l>", "<cmd>RexFocusRight<cr>", mode = { "n", "t" } },
    },
  },
}
