---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
