-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
      },
      highlight = {
        enable = false,
      },
      indent = {
        enable = true,
        disable = { "python", "verilog", "systemverilog" },
      },
      textobjects = {
        enable = false,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 2,
    },
  },
}
