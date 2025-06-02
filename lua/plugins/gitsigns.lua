return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      signcolumn = false,
    },
    keys = {
      {
        "[S",
        function() require("gitsigns").nav_hunk("prev", { target = "staged" }) end,
        desc = "Previous Git staged hunk",
      },
      {
        "]S",
        function() require("gitsigns").nav_hunk("next", { target = "staged" }) end,
        desc = "Next Git staged hunk",
      },
    },
  },
}
